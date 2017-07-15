//
//  HHZBase64Encrption.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZBase64Encrption : NSObject
/**
 *  Base64加密
 *
 *  @param string 要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(nullable NSString *)base64StringFromText:(nonnull NSString *)string;


/**
 *  Base64解密
 *
 *  @param base64 要解密的字符串
 *
 *  @return 返回解密后的字符串
 */
+(nullable NSString *)base64FromBase64String:(nonnull NSString *)base64;
@end

NS_ASSUME_NONNULL_END
