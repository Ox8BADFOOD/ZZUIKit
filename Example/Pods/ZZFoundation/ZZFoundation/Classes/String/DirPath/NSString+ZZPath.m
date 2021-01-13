//
//  NSString+Path.m
//  lock
//
//  Created by ZZBB on 2018/5/2.
//  Copyright © 2018年 BYM. All rights reserved.
//

#import "NSString+ZZPath.h"

@implementation NSString (ZZPath)
///MARK: - 获得目录路径
- (instancetype)ZZDirCache{
	// 1.获取caches目录
	NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
	// 2.生成绝对路径
	return [path stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)ZZDirDoc{
	// 1.获取caches目录
	NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	// 2.生成绝对路径
	return [path stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)ZZDirTemp{
	// 1.获取caches目录
	NSString *path = NSTemporaryDirectory();
	// 2.生成绝对路径
	return [path stringByAppendingPathComponent:[self lastPathComponent]];
}

@end
