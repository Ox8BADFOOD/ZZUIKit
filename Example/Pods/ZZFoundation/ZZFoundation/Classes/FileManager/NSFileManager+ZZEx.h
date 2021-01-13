//
//  NSFileManager+ZZEx.h
//  Kiwi
//
//  Created by Max on 2020/12/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (ZZEx)
/// 创建文件夹
/// @param path 完整的文件夹路径
/// @return 返回创建结果
+(BOOL)ZZCreatDir:(NSString *)path;

/// 创建文件
/// @param filePath 完整的文件路径
/// @return 返回创建结果
+(BOOL)ZZCreatFile:(NSString*)filePath;

/// 写入文件，并且返回写入结果
/// @param filePath 完整的文件路径
/// @param data 数据
/// @return 返回写入结果
/// @discussion 如果filePath里的文件不存在，会去主动创建
+(BOOL)ZZWriteToFile:(NSString*)filePath contents:(NSData *)data;

/// 往文件后追加数据
/// @param data 数据
/// @param filePath 完整的文件路径
/// @return 返回写入结果
/// @discussion: 如果filePath里的文件不存在，会去主动创建
+(BOOL)ZZAppendData:(NSData*)data withPath:(NSString *)filePath;

/// 读取文件数据
/// @param path 完整的文件路径
/// @return 返回读取的结果
+(NSData*)ZZReadFileData:(NSString *)path;

/// 获取文件列表
/// @param path 完整的文件路径
/// @return 返回读取文件列表数组
+(NSArray*)ZZFileList:(NSString*)path;

/// 获取文件夹下所有文件(深度遍历)
/// @param path 完整的文件路径
/// @return 返回读取文件列表数组
+(NSArray*)ZZAllFileList:(NSString*)path;

+(BOOL)ZZMoveFile:(NSString *)fromPath toPath:(NSString *)toPath toPathIsDir:(BOOL)dir;

+(BOOL)ZZMoveItemAtPath:(NSString*)fromPath toPath:(NSString*)toPath;

+(BOOL)ZZRemoveFile:(NSString*)filePath;

/// 删除某些后缀的文件
/// @param suffixList 后缀名集合
/// @param path 搜索路径
/// @param deep 是否是深度遍历
+(void)ZZRemoveFileSuffixList:(NSArray<NSString*>*)suffixList filePath:(NSString*)path deep:(BOOL)deep;


/// 获取文件大小
/// @param path 文件路径
+(long long)ZZFileSiZZze:(NSString*)path;

/// 获取文件信息
/// @param path 文件路径
+(NSDictionary*)ZZFileInfo:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
