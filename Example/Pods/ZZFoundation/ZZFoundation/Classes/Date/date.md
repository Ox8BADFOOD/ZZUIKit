# Date总结

## NSDate转字符串时间

初始化一个NSDate时间`[NSDate date]`，获取的是零时区的时间（格林尼治的时间: 年-月-日 时:分:秒: +时区），而==北京时间是东八区==时间，因为时区不同，所以打印的时间相差了8小时。此刻表示的时间是一样的。

```swift

NSDate *date = [NSDate date];

NSLog(@"date时间 = %@", date);

    

NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];

NSString *dateStr = [formatter stringFromDate:date];

NSLog(@"字符串时间 = %@", dateStr);

打印结果：
        2016-12-07 10:44:24.470 timeTest[32743:2995134] date时间 = 2016-12-07 02:44:24 +0000
       
 
        2016-12-07 10:44:24.471 timeTest[32743:2995134] 字符串时间 = 2016-12-07 10:44:24 +0800
```

打印结果前面的时间是北京时间：2016-12-07 10:44:24.470。而date打印出来的时间显示少了8小时，因为它表示的是零时区(+0000)时间02:44:24。此刻对应东八区的北京时间就是10:44:24。只是时区不同，表示的时间点是一样的。好比1公斤和2斤，重量是一样的。[NSDate date]获取的时间单位是零时区(+0000)，我们所要的北京时间的单位是东八区(+0800)。

系统会默认[NSDate date]获取的时间为零时区时间，而经过NSDateFormatter转化为字符串时间就是当前所在时区的准确时间，并没有8小时误差。

转字符串时间的时区设定

上文中NSDate时间转为字符串时间并没有设置NSDateFormatter的timeZone。不设置会默认使用当前所在的时区，与设置系统时区formatter.timeZone = [NSTimeZone systemTimeZone]的效果是一样的。

也可以设置时区，获取指定时区的字符串时间

```swift
NSDate *date = [NSDate date]; 
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//东八区时间
formatter.timeZone = [NSTimeZone timeZoneWithName:@"AsiShanghai"];
NSString *dateStr = [formatter stringFromDate:date];
NSLog(@"字符串时间 = %@", dateStr);
```

这时获取的时间就是东八区时间，哪怕手机拿到零时区的格林尼治，获取的也是东八区的时间，因为这里指定时区了。也有如下时区指定：

```swift
//东九区时间
formatter.timeZone = [NSTimeZone timeZoneWithName:@"AsiTokyo"];
//零区时间
formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
       
```

通过下面方法可得到系统支持的时区对应的字符串常量：

```swift
NSArray *zones = [NSTimeZone knownTimeZoneNames];      
for (NSString *zone in zones) {    
   NSLog(@"时区名 = %@", zone); 
}
```

- 字符串时间转NSDate
字符串时间转为NSDate时间也会有时区问题。也会遇到有所谓的8小时误差，其实就是时区不同。比如下面的例子：

```swift
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
NSDate *newDate = [formatter dateFromString:@"2016-12-014:06:24 +0800"];
NSLog(@"newDate = %@", newDate);

打印结果：
        2016-12-07 14:12:17.468 timeTest[34279:3155380] newDate = 2016-12-07 06:06:24 +0000
```

NSDateFormatter的指定格式是：@"yyyy-MM-dd HH:mm:ss Z"。这里面的Z指的是时区。要转化的字符串时间格式必须和这个格式匹配，上面给定的字符串时间是：@"2016-12-07 14:06:24 +0800"，是一个东八区时间，转化为NSDate后是零区时间2016-12-07 06:06:24 +0000，字面显示上少了8小时，其实时间一样。

其实如果上面给定的字符串时间为@"2016-12-07 14:06:24 +0000"，转化出来的NSDate时间会完全一样，因为字符串时间为零时区时间，不存在时区误差。大家可以试一下。

当不指定字符串时间的时区时，即没有后面的+0800，同时要把NSDateFormatter时间格式里的Z去掉，保证格式匹配。系统会认为字符串时间是系统所在时区的时间，转化为NSDate时间是零时区时间。

同样，也可以使用formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];这种方式指定字符串时间的时区，和用Z对应+0000是一样的。

- NSDate转当前时区的NSDate时间

因为[NSDate date]得出的时间是零时区时间，当我们要获取当前所在时区的NSDate时间时，通常会用以下方法：

```swift
NSDate *date = [NSDate date]; 
NSTimeZone *zone = [NSTimeZone systemTimeZone];
NSInteger interval = [zone secondsFromGMTForDate:date];
NSDate *localDate = [datedateByAddingTimeInterval:interval];
NSLog(@"localDate = %@",localDate);

打印结果：

2016-12-07 14:49:03.777 timeTest[34519:3183548] localDate = 2016-12-07 14:49:03 +0000
       
```

上面代码中zone是当前时区，interval是当前时区和零时区时间的差值，最后结果localDate是零时区时间date加上这个差值interval，得到当前时区的NSDate时间。更有甚者，在开发中直接加8*60*60或28800这样的值，因为相差8小时嘛。这样在东八区没问题，在其他时区时间就错了。

其实这种做法是不科学的，因为得到的最终时间还是零时区时间，时间后面明显是+0000，在使用中一般不显示时区，所以认为当做当前时区的时间使用也未尝不可。此为大坑！

坑1：这时如果转为字符串时间，又会增加8小时。因为做时间转换的时候，系统会认为这个NSDate是零时区，得到的字符串时间是东八区的。

解决办法是：将错就错，字符串时间也设置为零时区的字符串时间。从深坑跌入更深的坑！

```swift

NSDate *date = [NSDate date];
NSTimeZone *zone = [NSTimeZone systemTimeZone];
NSInteger interval = [zone secondsFromGMTForDate:date];
NSDate *localDate = [datdateByAddingTimeInterval:interval];
NSDateFormatter *formatter = [[NSDateFormatter alloc] ini;
[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
formatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
NSString *dateStr = [formatter stringFromDate:localDate];
NSLog(@"字符串时间 = %@", dateStr);
```

这里的@"UTC"是指世界标准时间，也是现在用的时间标准，东八区比这个时间也是快8小时，这里填@"GMT"也是可以的。