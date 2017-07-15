//
//  HHZHttpEncryption.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface HHZHttpEncryption : NSObject
/**
 *  类似微信支付后台接口的加密规则(目前不支持结构复杂的请求参数),如果要使用，请与后台协商公私钥。
 *
 *  @param parameters 请求参数
 *  @param keyArray   加密的数组
 *
 *  @return
 */
+(NSMutableDictionary *)encrytionParameterMethod1:(NSMutableDictionary *)parameters privateKeyArray:(NSArray *)keyArray;

/**
 *  类似微信支付后台接口的加密规则(目前不支持结构复杂的请求参数),如果要使用，请与后台协商公私钥。对加密后的参数再进行AES加密
 *
 *  @param parameters 请求参数
 *  @param keyArray   加密的数组
 *  @param AESKey     AES的Key值
 *
 *  @return
 */
+(NSMutableDictionary *)encrytionParameterMethod1:(NSMutableDictionary *)parameters privateKeyArray:(NSArray *)keyArray AESKey:(NSString *)AESKey;

/**
 *  网络请求私钥数组
 *
 *  @return
 */
+(NSArray *)setMethod1ParametersArray;


/**
 *  网络请求私钥数组
 *
 *  @return
 */
+(NSString *)setMethod1AESKey;
@end

NS_ASSUME_NONNULL_END
