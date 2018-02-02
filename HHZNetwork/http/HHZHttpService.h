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
#import <HHZUtils/HHZMethodException.h>
#import "HHZHttpStruct.h"
#import "HHZHttpRequestCondition.h"
#import "HHZHttpClient.h"

typedef void(^RequestFailStateBlock)(id obj);

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
 *  处理网络请求各种失败情况
 *
 *  @param responeseObject 网络结果数据结构
 */
-(void)handleFailInfo:(HHZHttpResponse *)responeseObject block:(RequestFailStateBlock)block;

#pragma mark 辅助方法
/**
 *  判断服务器字段是否为空的情况
 */
-(BOOL)handleServiceParameterWhetherIsNull:(id)obj;

/**
 *  判断服务器字段是否为空的情况   (YES认为(null)为正常数据不进行排除，NO认为(null)为服务器异常导致的数据需要进行排除)
 */
-(BOOL)handleServiceParameterWhetherIsNull:(id)obj allowNullString:(BOOL)allowNullString;

@end
