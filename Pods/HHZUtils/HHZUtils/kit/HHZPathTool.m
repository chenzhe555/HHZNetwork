//
//  HHZPathTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZPathTool.h"

@implementation HHZPathTool
+(NSString *)getDocumentPath:(NSString *)fileName
{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName];
}

+(NSString *)getCathePath:(NSString *)fileName
{
    return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName];
}

+(BOOL)deleteAllChildForPath:(NSString *)filePath
{
    NSArray * pathArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filePath error:nil];
    BOOL success = YES;
    
    for (int i = 0; i < pathArray.count; i++)
    {
        if (![[NSFileManager defaultManager] removeItemAtPath:[pathArray objectAtIndex:i] error:nil])
        {
            success = NO;
            return success;
        }
    }
    return success;
}
@end
