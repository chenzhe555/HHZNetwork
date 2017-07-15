//
//  HHZHttpServiceDelegate.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


/*
 网络请求回调事件
 */
#import <Foundation/Foundation.h>
@class HHZHttpResponse;
@class HHZHttpRequest;
@class HHZHttpRequestCondition;

@protocol HHZHttpServiceDelegate <NSObject>
@optional
/**
 *  处理完请求逻辑之后的回调
 *
 *  @param request   装载完毕的请求参数
 *  @param condition 传入的Condition条件
 */
-(void)beforeSendRequest:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition;
/**
 *  请求成功
 *
 *  @param response
 */
-(void)requestSuccess:(HHZHttpResponse *)response;

/**
 *  请求失败（包括网络失败以及请求失败）
 *
 *  @param errorInfo
 */
-(void)requestFail:(HHZHttpResponse *)response;
@end
