//
//  HHZRegularTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZRegularTool : NSObject
/**
 *  正则匹配
 *
 *  @param matchString 匹配字符串
 *  @param expression  正则表达式
 *
 *  @return
 */
+(BOOL)matchingWithMatchingString:(NSString *)matchString andRegularExpression:(NSString *)expression;

/**
 *  匹配电话号码
 *
 *  @param phone 匹配的电话号码
 *
 *  @return
 */
+(BOOL)matchingPhoneNumber:(NSString *)phone;

/**
 *  匹配邮箱
 *
 *  @param email 匹配的邮箱号
 *
 *  @return
 */
+(BOOL)matchingEmailNumber:(NSString *)email;

/**
 *  匹配身份证号
 *
 *  @param identityCard 匹配的身份证
 *
 *  @return
 */
+(BOOL)matchingIdentityCard:(NSString *)identityCard;

/**
 *  判断输入是否为空或者全是空格
 *
 *  @param str 要检验的字符
 *
 *  @return
 */
+(BOOL)isEmptyOrAllSpace:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
