//
//  HHZPlistTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZPlistTool.h"

@implementation HHZPlistTool

+(NSString *)getPlistPath:(NSString *)plistFileName
{
    return [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];
}

+(id)getPlistValueForKey:(NSString *)plistKey plistName:(NSString *)plistFileName
{
//    //先从缓存中获取
//    NSString * key = [NSString stringWithFormat:@"%@-%@",plistFileName,plistKey];
//    id obj = [HHZCacheTool getCacheObjectforKey:key];
//    //如果没有再从本地磁盘读取
//    if (obj != nil) {
//        return [obj objectForKey:plistKey];
//    }
//    else {
//        NSDictionary * dic = [[NSDictionary alloc] initWithContentsOfFile:[self getPlistPath:plistFileName]];
//        [HHZCacheTool setCacheObject:dic forKey:key];
//        return [dic objectForKey:plistKey];
//    }
    return [[[NSDictionary alloc] initWithContentsOfFile:[self getPlistPath:plistFileName]] objectForKey:plistKey];
}
@end
