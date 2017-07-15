//
//  HHZHttpURLManager.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/29.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 如果要用Manager的话，一定要重写init方法!!!（可以参考.m文件）
 */
 

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZHttpURLManager : NSObject
/**
 *  获取URL管理实例 (如果要用Manager的话，一定要重写init方法!!!（可以参考.m文件）)
 *
 *  @return
 */
+(instancetype)shareManager;

#pragma mark 服务器返回新的url地址

/**
 *  设置网络请求的基本地址
 *
 *  @param dic
 */
-(void)setHttpRequestURL:(NSDictionary *)dic;






#pragma mark 获取请求需要的URL地址们

/**
 *  获取测试地址的请求地址
 *
 *  @return 
 */
-(NSString *)getTestUrl;

@end

NS_ASSUME_NONNULL_END
