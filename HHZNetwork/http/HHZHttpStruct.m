//
//  HHZHttpStruct.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpStruct.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HHZHttpRequest
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requestMethod = @"POST";
        self.timeOut = 30;
        self.encryptionType = HHZEncryptionTypeNone;
        self.isNeedToken = YES;
        self.alertType = HHZHttpAlertTypeNone;
    }
    return self;
}
@end

@implementation HHZHttpResponse

@end

@implementation HHZHttpResult
+(HHZHttpResult *)generateDefaultResult:(NSUInteger)tag RequestURL:(NSString *)url Task:(NSURLSessionDataTask *)task
{
    HHZHttpResult * result = [[HHZHttpResult alloc] init];
    result.tag = tag;
    result.requestURL = url;
    result.requestTask = task;
    return result;
}
@end

NS_ASSUME_NONNULL_END
