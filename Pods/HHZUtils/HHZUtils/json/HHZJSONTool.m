//
//  HHZJSONTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZJSONTool.h"

@implementation HHZJSONTool

+(NSString *)jsonArray:(NSArray *)jsonArrar
{
    if (!jsonArrar) return nil;
    
    return [self transformToString:jsonArrar Options:0];
}

+(NSString *)jsonArrayWithPrint:(NSArray *)jsonArrar
{
    if (!jsonArrar) return nil;
    
    return [self transformToString:jsonArrar Options:NSJSONWritingPrettyPrinted];
}

+(NSString *)jsonDictionary:(NSDictionary *)jsonDic
{
    if (!jsonDic) return nil;
    
    return [self transformToString:jsonDic Options:0];
}

+(NSString *)jsonDictionaryWithPrint:(NSDictionary *)jsonDic
{
    if (!jsonDic) return nil;
    
    return [self transformToString:jsonDic Options:NSJSONWritingPrettyPrinted];
}

+(nullable NSString *)transformToString:(id)obj Options:(NSJSONWritingOptions)options
{
    //判断是否能进行JSON转换
    if ([NSJSONSerialization isValidJSONObject:obj]) {
        NSError * error = nil;
        NSData * data = [NSJSONSerialization dataWithJSONObject:obj options:options error:&error];
        if (!data) return nil;
        
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
