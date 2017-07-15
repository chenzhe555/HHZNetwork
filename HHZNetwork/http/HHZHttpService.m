//
//  HHZHttpService.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpService.h"

#define HHZHttpService_CLASS_NAME @"HHZHttpService"

@implementation HHZHttpService

-(void)manageServiceSuccess:(HHZHttpResponse *)responseObject
{
    @throw [HHZMethodException exceptionWithClass:HHZHttpService_CLASS_NAME Method:NSStringFromSelector(_cmd)];
}

-(void)manageServiceFail:(HHZHttpResponse *)responseObject
{
    @throw [HHZMethodException exceptionWithClass:HHZHttpService_CLASS_NAME Method:NSStringFromSelector(_cmd)];
}

-(void)handleFailInfo:(HHZHttpResponse *)responeseObject
{
    @throw [HHZMethodException exceptionWithClass:HHZHttpService_CLASS_NAME Method:NSStringFromSelector(_cmd)];
}

@end
