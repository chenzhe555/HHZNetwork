//
//  HHZHttpEncryption.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpEncryption.h"
#import "HHZMD5Encryption.h"
#import "HHZAESEncryption.h"
#import "HHZMethodException.h"

/**
 *  加密存放字典
 */
static NSMutableDictionary * encryDictionary;

/*加密的间隔符*/
static  NSString * const KEY_SEPARATOR = @"=";
static  NSString * const VALUE_SEPARATOR = @"&";
static  NSString * const FINAL_SEPARATOR = @"-";

@implementation HHZHttpEncryption
+(NSMutableDictionary *)encrytionParameterMethod1:(NSMutableDictionary *)parameters privateKeyArray:(NSArray *)keyArray
{
    encryDictionary = [NSMutableDictionary dictionary];
    
    //加盐和时间戳
    srandom((int)time(NULL));
    NSInteger index = random()%keyArray.count;
    [parameters setObject:[NSString stringWithFormat:@"%ld",(long)index] forKey:@"salt_index"];
    NSString * timeStr = [NSString stringWithFormat:@"%llu",[self getTimeStamp]];
    [parameters setObject:timeStr forKey:@"time_stamp"];
    
    
    //参数加密
    NSMutableDictionary * copyDic = parameters.mutableCopy;
    [self encryption:copyDic];
    
    //参数根据子节点顺序排序
    NSMutableString * mutaString = [self appendItem:encryDictionary];
    
    //拼接字符串
    [mutaString appendString:[keyArray objectAtIndex:index]];
    
    NSString * encrStr = [HHZMD5Encryption MD5EncryptionToString:mutaString];
    
    //拼接盐值和时间戳
    NSMutableString * signStr = [[NSMutableString alloc] initWithString:encrStr];
    [signStr appendFormat:@",%ld",(long)index];
    [signStr appendFormat:@",%@",timeStr];
    [parameters setObject:signStr forKey:@"sign"];
    
    //移除盐和时间戳
    [parameters removeObjectForKey:@"salt_index"];
    [parameters removeObjectForKey:@"time_stamp"];
    
    
    return parameters;
}


+(NSMutableDictionary *)encrytionParameterMethod1:(NSMutableDictionary *)parameters privateKeyArray:(NSArray *)keyArray AESKey:(NSString *)AESKey
{
    parameters = [self encrytionParameterMethod1:parameters privateKeyArray:keyArray];
    NSData * data = [NSJSONSerialization dataWithJSONObject:parameters.mutableCopy options:NSJSONWritingPrettyPrinted error:nil];
    NSString * jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString * AESStr = [HHZAESEncryption AES128Encrypt:jsonStr WithKey:AESKey];
    [parameters removeAllObjects];
    [parameters setObject:AESStr forKey:@"encryption_data"];
    return parameters;
}



+(UInt64)getTimeStamp
{
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    return recordTime;
}

/**
 *  加密对字典的处理
 *
 *  @param encryptionDic 加密的字典
 */
+(void)encryption:(NSMutableDictionary *)encryptionDic
{
    NSArray * arr = encryptionDic.allKeys;
    
    for (int i = 0; i < arr.count; i++)
    {
        NSString * key = [arr objectAtIndex:i];
        id value = [encryptionDic objectForKey:key];
        if ([value isKindOfClass:[NSArray class]])
        {
            [self encryptionArray:value andencryKey:key];
        }
        else if ([value isKindOfClass:[NSDictionary class]])
        {
            [self encryption:value];
        }
        else
        {
            if ([encryDictionary objectForKey:key])
            {
                NSMutableArray * haveArray = [encryDictionary objectForKey:key];
                [haveArray addObject:[[self getStringWithObj:value] lowercaseString]];
                [encryDictionary setObject:haveArray forKey:[key lowercaseString]];
            }
            else
            {
                NSMutableArray * noArray = [NSMutableArray array];
                [noArray addObject:[[self getStringWithObj:value] lowercaseString]];
                [encryDictionary setObject:noArray forKey:[key lowercaseString]];
            }
        }
    }
}

/**
 *  获取字符串用于加密
 *
 *  @param obj 当前value值
 *
 *  @return
 */
+(NSString *)getStringWithObj:(id)obj
{
    if ([obj isKindOfClass:[NSNumber class]])
    {
        return [NSString stringWithFormat:@"%@",obj];
    }
    else if ([obj isKindOfClass:[NSString class]])
    {
        return obj;
    }
    else
    {
        return @"";
    }
}

/**
 *  对value为数组的处理
 *
 *  @param encryptionArray 待处理数组
 *  @param key             待处理数组对应的数组
 */
+(void)encryptionArray:(NSArray *)encryptionArray andencryKey:(NSString *)key
{
    for (int i = 0; i < encryptionArray.count; i++)
    {
        id value = [encryptionArray objectAtIndex:i];
        if ([value isKindOfClass:[NSArray class]])
        {
            [self encryptionArray:value andencryKey:key];
        }
        else if ([value isKindOfClass:[NSDictionary class]])
        {
            [self encryption:value];
        }
        else
        {
            if ([encryDictionary objectForKey:key])
            {
                NSMutableArray * haveArray = [encryDictionary objectForKey:key];
                [haveArray addObject:[[self getStringWithObj:value] lowercaseString]];
                [encryDictionary setObject:haveArray forKey:[key lowercaseString]];
            }
            else
            {
                NSMutableArray * noArray = [NSMutableArray array];
                [noArray addObject:[[self getStringWithObj:value] lowercaseString]];
                [encryDictionary setObject:noArray forKey:[key lowercaseString]];
            }
        }
    }
}

/**
 *  拼接请求参数
 *
 *  @param totalDic 拿到的所有子节点组成的字典
 *
 *  @return
 */
+(NSMutableString *)appendItem:(NSMutableDictionary *)totalDic
{
    NSArray * arr = totalDic.allKeys;
    arr = [arr sortedArrayUsingSelector:@selector(compare:)];
    NSMutableString * mutaStr = [[NSMutableString alloc] init];
    NSString * key = nil;
    NSArray * valueArray = nil;
    NSInteger count;
    for (int i = 0; i < arr.count; i++)
    {
        key = [arr objectAtIndex:i];
        [mutaStr appendString:key];
        [mutaStr appendString:KEY_SEPARATOR];
        valueArray = [totalDic objectForKey:key];
        valueArray = [valueArray sortedArrayUsingSelector:@selector(compare:)];
        count = valueArray.count;
        for (int i = 0; i < count; i++)
        {
            [mutaStr appendString:[NSString stringWithFormat:@"%@",[valueArray objectAtIndex:i]]];
            
            if (i != count - 1)
            {
                [mutaStr appendString:FINAL_SEPARATOR];
            }
        }
        [mutaStr appendString:VALUE_SEPARATOR];
    }
    
    [mutaStr deleteCharactersInRange:NSMakeRange(mutaStr.length - 1, 1)];
    return mutaStr;
}


+(NSArray *)setMethod1ParametersArray
{
    @throw [HHZMethodException exceptionWithClass:@"HHZHttpEncryption" Method:NSStringFromSelector(_cmd)];
}

+(NSString *)setMethod1AESKey
{
    @throw [HHZMethodException exceptionWithClass:@"HHZHttpEncryption" Method:NSStringFromSelector(_cmd)];
}

@end
