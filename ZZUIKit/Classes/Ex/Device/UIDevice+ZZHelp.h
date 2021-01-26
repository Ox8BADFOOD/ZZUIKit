//
//  UIDevice+ZZHelp.h
//  meimeika
//
//  Created by ZZBB on 2020/4/13.
//  Copyright © 2020 sun. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (ZZHelp)


///  用户给手机起的别名
-(NSString *)zz_PhoneAlias;

///  手机系统名
-(NSString *)zz_systemName;

/// 手机型号
-(NSString *)zz_phoneModel;

///  地方型号  （国际化区域名称）
-(NSString *)zz_localModel;

- (float)zz_systemVersion;
//标识应用程序的发布版本号
-(NSString *)zz_appVersion;
-(NSString *)zz_appBuildVersion;

- (NSString *)ZZPlatform;
- (NSString *)ZZPlatformString;

- (NSUInteger)ZZBusFrequency;
- (NSUInteger)ZZCpuFrequency;
- (NSUInteger)ZZCpuCount;

- (NSUInteger)ZZTotalMemory;
- (NSNumber *)ZZTotalDiskSpace;

- (NSUInteger)ZZUserMemory;

- (NSNumber *)ZZFreeDiskSpace;

- (NSString *)ZZMACAddress;
- (NSString *)ZZIPAddresses;

@end

NS_ASSUME_NONNULL_END
