//
//  HHZMethodException.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZMethodException.h"

@implementation HHZMethodException
+(NSException *)exceptionWithClass:(NSString *)className Method:(NSString *)methodName
{
    return [NSException exceptionWithName:@"Method Must be implement:" reason:[NSString stringWithFormat:@"( %@ )You must override %@ in a subclass",className, methodName] userInfo:nil];
}
@end
