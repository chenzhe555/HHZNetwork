//
//  HHZHttpManager.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpManager.h"

@implementation HHZHttpManager

+(instancetype)shareManager
{
    static HHZHttpManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [HHZHttpManager manager];
    });
    //默认不是HTTPS和允许抓包
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    //默认支持以下几种返回值类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain",@"text/json",@"text/javascript",nil];
    return manager;
}

@end
