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
 *  存放URL地址的字典
 */
@property (nonatomic, strong) NSMutableDictionary * urlDic;

/**
 *  获取URL管理实例
 *
 *  @return
 */
+(instancetype)shareManager;

/**
 *  加载URLs
 *
 *  @return
 */
-(void)loadURLs;

/**
 *  设置网络请求的基本地址
 *
 *  @param dic
 */
-(void)pushURL:(NSString *)httpURL Key:(NSString *)key;

/**
 *  更新网络请求基本地址
 *
 *  @param dic
 */
-(void)updateHttpRequestURL:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
