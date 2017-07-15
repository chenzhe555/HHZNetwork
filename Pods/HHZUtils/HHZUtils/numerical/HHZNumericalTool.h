//
//  HHZNumericalTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 17/1/3.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZNumericalTool : NSObject

/**
 *  多个数相加,出现异常都会返回0.0
 *
 *  @param numbers 计算的参数
 *
 *  @return 
 */
+(NSDecimalNumber *)addNumbers:(nullable NSObject *)numbers, ...NS_REQUIRES_NIL_TERMINATION;

/**
 *  多个数相减,出现异常都会返回0.0
 *
 *  @param numbers 计算的参数
 *
 *  @return
 */
+(NSDecimalNumber *)subtractNumbers:(nullable NSObject *)numbers, ...NS_REQUIRES_NIL_TERMINATION;

/**
 *  多个数相乘,出现异常都会返回0.0
 *
 *  @param numbers 计算的参数
 *
 *  @return
 */
+(NSDecimalNumber *)multiplyNumbers:(nullable NSObject *)numbers, ...NS_REQUIRES_NIL_TERMINATION;

/**
 *  多个数相除,出现异常都会返回0.0
 *
 *  @param numbers 计算的参数
 *
 *  @return
 */
+(NSDecimalNumber *)dividNumbers:(nullable NSObject *)numbers, ...NS_REQUIRES_NIL_TERMINATION;
@end

NS_ASSUME_NONNULL_END
