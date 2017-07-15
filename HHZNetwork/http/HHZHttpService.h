//
//  HHZHttpService.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 网络请求服务类
 */

#import "HHZHttpServiceDelegate.h"
#import "HHZMethodException.h"
#import "HHZHttpStruct.h"
#import "HHZHttpRequestCondition.h"
#import "HHZHttpClient.h"

@interface HHZHttpService : NSObject
@property (nonatomic, assign) id<HHZHttpServiceDelegate> serviceDelegate;

/**
 *  处理成功从服务器得到数据
 *
 *  @param responseObject 网络结果数据结构
 *  @param type           弹出框类型
 */
-(void)manageServiceSuccess:(HHZHttpResponse *)responseObject;

/**
 *  处理未得到服务器响应的情况
 *
 *  @param responseObject 网络结果数据结构
 *  @param type           弹出框类型
 */
-(void)manageServiceFail:(HHZHttpResponse *)responseObject;


/**
 *  处理服务器未连接成功error以及网络请求成功返回error两种情况
 *
 *  @param responeseObject 网络结果数据结构
 */
-(void)handleFailInfo:(HHZHttpResponse *)responeseObject;

@end
