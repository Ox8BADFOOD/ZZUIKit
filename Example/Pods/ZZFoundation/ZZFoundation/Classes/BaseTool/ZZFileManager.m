//
//  ZZFileManager.m
//  Aspects
//
//  Created by Max on 2021/1/26.
//

#import "ZZFileManager.h"

@implementation ZZFileManager
#pragma mark -- 创建
+(BOOL)ZZCreatDir:(NSString *)path{
    if (path.length==0) {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isSuccess = YES;
    BOOL isExist = [fileManager fileExistsAtPath:path];
    if (isExist==NO) {
        NSError *error;
        if (![fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
            isSuccess = NO;
            NSLog(@"creat Directory Failed:%@",[error localizedDescription]);
        }
    }
    return isSuccess;
}

+(BOOL)ZZCreatFile:(NSString*)filePath{
    if (filePath.length==0) {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        return YES;
    }
    NSError *error;
    NSString *dirPath = [filePath stringByDeletingLastPathComponent];
    BOOL isSuccess = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        NSLog(@"creat File Failed:%@",[error localizedDescription]);
    }
    if (!isSuccess) {
        return isSuccess;
    }
    isSuccess = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    return isSuccess;
}
#pragma mark -- 改
+(BOOL)ZZWriteToFile:(NSString*)filePath contents:(NSData *)data{
    if (filePath.length==0) {
        return NO;
    }
    BOOL result = [self ZZCreatFile:filePath];
    if (result) {
        if ([data writeToFile:filePath atomically:YES]) {
            NSLog(@"write Success");
        }else{
            NSLog(@"write Failed");
        }
    }
    else{
        NSLog(@"write Failed");
    }
    return result;
}

+(BOOL)ZZAppendData:(NSData*)data withPath:(NSString *)filePath{
    if (filePath.length==0) {
        return NO;
    }
    BOOL result = [self ZZCreatFile:filePath];
    if (result) {
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:filePath];
        [handle seekToEndOfFile];
        [handle writeData:data];
        [handle synchronizeFile];
        [handle closeFile];
    }
    else{
        NSLog(@"appendData Failed");
    }
    return result;
}

#pragma mark -- 读
+(NSData*)ZZReadFileData:(NSString *)path{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSData *fileData = [handle readDataToEndOfFile];
    [handle closeFile];
    return fileData;
}

+(NSArray*)ZZFileList:(NSString*)path{
    if (path.length==0) {
        return nil;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"getFileList Failed:%@",[error localizedDescription]);
    }
    return fileList;
}

+(NSArray*)ZZAllFileList:(NSString*)path{
    if (path.length==0) {
        return nil;
    }
    NSArray *fileArray = [self ZZFileList:path];
    NSMutableArray *fileArrayNew = [NSMutableArray array];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    for (NSString *aPath in fileArray) {
        NSString * fullPath = [path stringByAppendingPathComponent:aPath];
        BOOL isDir = NO;
        if ([fileManager fileExistsAtPath:fullPath isDirectory:&isDir]) {
            if (isDir) {
                [fileArrayNew addObjectsFromArray:[self ZZAllFileList:fullPath]];
            }else{
                [fileArrayNew addObject:fullPath];
            }
        }
    }
    return fileArrayNew;
}
#pragma mark -- 移动
+(BOOL)ZZMoveFile:(NSString *)fromPath toPath:(NSString *)toPath toPathIsDir:(BOOL)dir{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fromPath]) {
        NSLog(@"Error: fromPath Not Exist");
        return NO;
    }
    BOOL isDir = NO;
    BOOL isExist = [fileManager fileExistsAtPath:toPath isDirectory:&isDir];
    if (isExist) {
        if (isDir) {
            if ([self ZZCreatDir:toPath]) {
                NSString *fileName = fromPath.lastPathComponent;
                toPath = [toPath stringByAppendingPathComponent:fileName];
                return [self ZZMoveItemAtPath:fromPath toPath:toPath];
            }
        }else{
            [self ZZRemoveFile:toPath];
            return [self ZZMoveItemAtPath:fromPath toPath:toPath];
        }
    }
    else{
        if (dir) {
            if ([self ZZCreatDir:toPath]) {
                NSString *fileName = fromPath.lastPathComponent;
                toPath = [toPath stringByAppendingPathComponent:fileName];
                return [self ZZMoveItemAtPath:fromPath toPath:toPath];
            }
        }else{
            return [self ZZMoveItemAtPath:fromPath toPath:toPath];
        }
    }
    return NO;
}

+(BOOL)ZZMoveItemAtPath:(NSString*)fromPath toPath:(NSString*)toPath{
    BOOL result = NO;
    NSError * error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
        result = [fileManager moveItemAtPath:fromPath toPath:toPath error:&error];
    if (error){
        NSLog(@"moveFile Fileid：%@",[error localizedDescription]);
    }
    return result;
}
#pragma mark -- 删除
+(BOOL)ZZRemoveFile:(NSString*)filePath{
    BOOL isSuccess = NO;
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    isSuccess = [fileManager removeItemAtPath:filePath error:&error];
    if (error) {
        NSLog(@"removeFile Field：%@",[error localizedDescription]);
    }else{
        NSLog(@"removeFile Success");
    }
    return isSuccess;
}

+(void)ZZRemoveFileSuffixList:(NSArray<NSString*>*)suffixList filePath:(NSString*)path deep:(BOOL)deep{
    NSArray *fileArray = nil;
    if (deep) {  // 是否深度遍历
        fileArray = [self ZZAllFileList:path];
    }else{
        fileArray = [self ZZFileList:path];
        NSMutableArray *fileArrayTmp = [NSMutableArray array];
        for (NSString *fileName in fileArray) {
            NSString* allPath = [path stringByAppendingPathComponent:fileName];
            [fileArrayTmp addObject:allPath];
        }
        fileArray = fileArrayTmp;
    }
    for (NSString *aPath in fileArray) {
        for (NSString* suffix in suffixList) {
            if ([aPath hasSuffix:suffix]) {
                [self ZZRemoveFile:aPath];
            }
        }
    }
}


+(long long)ZZFileSiZZze:(NSString*)path{
    unsigned long long fileLength = 0;
    NSNumber *fileSize;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:path error:nil];
    if ((fileSize = [fileAttributes objectForKey:NSFileSize])) {
        fileLength = [fileSize unsignedLongLongValue]; //单位是 B
    }
    return fileLength;
}

+(NSDictionary*)ZZFileInfo:(NSString*)path{
    NSError *error;
    NSDictionary *reslut =  [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
    if (error) {
        NSLog(@"getFileInfo Failed:%@",[error localizedDescription]);
    }
    return reslut;
}
@end
