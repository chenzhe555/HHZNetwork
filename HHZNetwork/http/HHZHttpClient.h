//
//  HHZHttpClient.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpStruct.h"
#import "HHZHttpRequestCondition.h"
#import "HHZHttpEncryption.h"
#import "HHZHttpTagBuilder.h"
#import "HHZDeviceTool.h"
#import "HHZHttpManager.h"

NS_ASSUME_NONNULL_BEGIN

//网络请求发送之前的回调
typedef void (^HHZBeforeSendRequest)(HHZHttpRequest * request,HHZHttpRequestCondition * condition);
//网络请求成功和失败的回调
typedef void (^HHZSuccessBlock)(HHZHttpResponse * responseObject);
typedef void (^HHZFailureBlock)(HHZHttpResponse * responseObject);

@interface HHZHttpClient : NSObject

/**
 *  向服务器发送请求，基本的请求
 *
 *  @param request 请求的数据对象
 *  @param success 成功回调
 *  @param fail    失败回调
 *
 *  @return 当前请求唯一的tag标识
 */
+(HHZHttpResult *)sendRequest:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition success:(HHZSuccessBlock)success fail:(HHZFailureBlock)fail beforeSend:(HHZBeforeSendRequest)beforeSend;


/**
 *  添加附加参数
 *
 *  @param request
 */
+(void)addExtraParamatersWithCondition:(HHZHttpRequest *)request;

@end


NS_ASSUME_NONNULL_END
