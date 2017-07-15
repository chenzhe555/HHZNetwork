//
//  HHZHttpTagBuilder.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpTagBuilder.h"

@interface HHZHttpTagBuilder()
/**
 *  网络请求唯一标示
 */
@property (nonatomic, assign) NSUInteger httpTag;
@end

@implementation HHZHttpTagBuilder
+(instancetype)shareManager
{
    static HHZHttpTagBuilder * builder;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        builder = [[HHZHttpTagBuilder alloc] init];
        builder.httpTag = 0;
    });
    
    return builder;
}

-(NSUInteger)getSoleHttpTag
{
    _httpTag++;
    if (_httpTag == UINT_MAX)
    {
        _httpTag = 0;
    }
    return _httpTag;
}
@end
