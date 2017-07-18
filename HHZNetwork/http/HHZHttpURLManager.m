//
//  HHZHttpURLManager.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/29.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpURLManager.h"
#import <HHZUtils/HHZPathTool.h>

@implementation HHZHttpURLManager
+(instancetype)shareManager
{
    static id manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        [manager setValue:[[NSMutableDictionary alloc] init] forKey:@"urlDic"];
    });
    return manager;
}

-(void)loadURLs
{    
    //先从本地plist文件中读取URL地址
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:[HHZPathTool getDocumentPath:@"hhzURLs.plist"]];
    if (dic && (dic.allKeys.count != 0))
    {
        [self.urlDic addEntriesFromDictionary:dic];
    }
}

-(void)pushURL:(NSString *)httpURL Key:(NSString *)key
{
    //如果已经有相应的Key值存在，则不赋值
    if (![self.urlDic.allKeys containsObject:key]) {
        [self.urlDic setObject:httpURL forKey:key];
    }
}

-(void)updateHttpRequestURL:(NSDictionary *)dic
{
    if (dic && (dic.allKeys.count != 0)) {
        [self.urlDic addEntriesFromDictionary:dic];
        
        //写入到本地文件中
        [self.urlDic writeToFile:[HHZPathTool getDocumentPath:@"hhzURLs.plist"] atomically:YES];
    }
}



@end
