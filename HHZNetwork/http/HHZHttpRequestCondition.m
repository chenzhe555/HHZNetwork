//
//  HHZHttpRequestCondition.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpRequestCondition.h"

@implementation HHZHttpRequestCondition
- (instancetype)init
{
    self = [super init];
    if (self) {
        _managerName = nil;
        _needToken = YES;
        _alertType = HHZHttpAlertTypeNative;
        _serializerType = HHZHttpSerializerType1;
        _httpType = HHZHttpProtocalTypeHTTP;
        _allowSniffer = YES;
        _allowInvalidCer = NO;
        _allowValidateDomain = NO;
    }
    return self;
}

+(instancetype)getNoneAlertCondition
{
    HHZHttpRequestCondition * condition = [[HHZHttpRequestCondition alloc] init];
    condition.alertType = HHZHttpAlertTypeNone;
    return condition;
}
@end
