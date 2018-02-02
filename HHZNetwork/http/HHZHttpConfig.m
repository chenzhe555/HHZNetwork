//
//  HHZHttpConfig.m
//  HHZNetwork
//
//  Created by 陈哲是个好孩子 on 2017/11/20.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpConfig.h"

@implementation HHZHttpConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.printHeaders = NO;
    }
    return self;
}

+(instancetype)shareManager
{
    static id obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[self class] new];
    });
    return obj;
}
@end
