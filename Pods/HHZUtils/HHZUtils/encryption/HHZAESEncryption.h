//
//  HHZAESEncryption.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZAESEncryption : NSObject
/**
 *  AES加密(256)
 *
 *  @param data 要加密的数据Data
 *  @param key  自定义key值
 *
 *  @return 返回加密后data
 */
+(NSData *)AES256Encrypt:(NSData *)data WithKey:(NSString *)key;



/**
 *  AES解密(256)
 *
 *  @param data 要解密的数据Data
 *  @param key  自定义key值
 *
 *  @return 返回解密后的data
 */
+(NSData *)AES256Decrypt:(NSData *)data WithKey:(NSString *)key;

/**
 *  AES加密(128)
 *
 *  @param str 要加密的字符串
 *  @param key 协商的key值
 *
 *  @return 加密后的字符串
 */
+(NSString *)AES128Encrypt:(NSString *)str WithKey:(NSString *)key;

/**
 *  AES解密(128)
 *
 *  @param str 解密字符串
 *  @param key 协商的key值
 *
 *  @return 解密后的字符串
 */
+(NSString *)AES128Decrypt:(NSString *)str WithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
