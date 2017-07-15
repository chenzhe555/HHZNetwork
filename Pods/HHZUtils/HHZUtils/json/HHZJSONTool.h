//
//  HHZJSONTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZJSONTool : NSObject
/**
 *  将数组转换成JSON串(输出的JSON串为一整行)
 *
 *  @param jsonArrar 要转换的数组
 *
 *  @return JSON串
 */
+(nullable NSString *)jsonArray:(NSArray *)jsonArrar;

/**
 *  将数组转换成JSON串(生成的JSON串是格式化输出的)
 *
 *  @param jsonArrar 要转换的数组
 *
 *  @return JSON串
 */
+(nullable NSString *)jsonArrayWithPrint:(NSArray *)jsonArrar;


/**
 *  将数组转换成JSON串(输出的JSON串为一整行)
 *
 *  @param jsonArrar 要转换的数组
 *
 *  @return JSON串
 */
+(nullable NSString *)jsonDictionary:(NSDictionary *)jsonDic;

/**
 *  将数组转换成JSON串(生成的JSON串是格式化输出的)
 *
 *  @param jsonArrar 要转换的数组
 *
 *  @return JSON串
 */
+(nullable NSString *)jsonDictionaryWithPrint:(NSDictionary *)jsonDic;
@end


NS_ASSUME_NONNULL_END
