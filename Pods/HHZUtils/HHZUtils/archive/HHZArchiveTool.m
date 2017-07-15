//
//  HHZArchiveTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZArchiveTool.h"
#import <objc/runtime.h>

@implementation HHZArchiveTool
+(BOOL)writeDataToFile:(NSString *)path data:(id)data
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
    if ([data isKindOfClass:[NSMutableArray class]])
    {
        NSMutableArray * arrData = (NSMutableArray *)data;
        NSMutableArray * writeArr = [NSMutableArray arrayWithCapacity:arrData.count];
        for (id object in arrData)
        {
            if (![object respondsToSelector:@selector(encodeWithCoder:)])
            {
                return NO;
            }
            NSData * mdata = [NSKeyedArchiver archivedDataWithRootObject:object];
            [writeArr addObject:mdata];
        }
        return [writeArr writeToFile:path atomically:NO];
    }
    if ([data isKindOfClass:[NSDictionary class]] || [data isKindOfClass:[NSMutableDictionary class]])
    {
        NSDictionary * dict = (NSDictionary *)data;
        NSMutableDictionary * newDict = [NSMutableDictionary dictionary];
        NSArray * dictKeys = [dict allKeys];
        for (id key in dictKeys)
        {
            id object = [dict objectForKey:key];
            if (![object respondsToSelector:@selector(encodeWithCoder:)])
            {
                return NO;
            }
            NSData * mdata = [NSKeyedArchiver archivedDataWithRootObject:object];
            [newDict setValue:mdata forKey:key];
        }
        return [newDict writeToFile:path atomically:NO];
    }
    if (![data respondsToSelector:@selector(encodeWithCoder:)])
    {
        return NO;
    }
    NSData * mdata = [NSKeyedArchiver archivedDataWithRootObject:data];
    return [mdata writeToFile:path atomically:YES];
}

+(id)getDataFromFile:(NSString *)path
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        return nil;
    }
    NSData * data = [NSData dataWithContentsOfFile:path];
    id objcet = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return objcet;
}
@end
