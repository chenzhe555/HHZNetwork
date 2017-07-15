//
//  HHZDESEncryption.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZDESEncryption : NSObject
/**
 *  DES加密
 *
 *  @param data 要加密的数据Data
 *  @param key  自定义的key值
 *
 *  @return 返回加密后的加密data,返回的data不能转换成NSString
 */
+(NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;



/**
 *  DES解密
 *
 *  @param data 要解密的数据Data
 *  @param key  自定义key值
 *
 *  @return 返回解密后的data
 */
+(NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
