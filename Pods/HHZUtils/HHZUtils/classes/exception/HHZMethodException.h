//
//  HHZMethodException.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HHZMethodException : NSObject
/**
 *  方法未重写实现异常
 *
 *  @param className  类名
 *  @param methodName 方法名
 *
 *  @return 
 */
+(nonnull NSException *)exceptionWithClass:(nonnull NSString *)className Method:(nonnull NSString *)methodName;
@end
