//
//  HHZHttpRequestCondition.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 后续根据项目扩展
 */

#import "HHZHttpStruct.h"
#import "HHZHttpEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHZHttpRequestCondition : NSObject
//Manager的类名，有多个Manager的时候传入名，默认是nil
@property (nonatomic, copy) NSString * managerName;

//是否需要带Token
@property (nonatomic, assign) BOOL needToken;

//失败后弹框的方式(默认弹系统框)
@property (nonatomic, assign) HHZHttpAlertType alertType;

/**
 *  请求的序列化方式(默认json/json)
 */
@property (nonatomic, assign) HHZHttpSerializerType serializerType;

/**
 *  HTTP/HTTPS(默认HTTP)
 */
@property (nonatomic, assign) HHZHttpProtocalType httpType;

/**
 *  Header头们
 */
@property (nonatomic, strong) NSDictionary * headersDic;

/**
 *  Cookies们
 */
@property (nonatomic, strong) NSArray<NSHTTPCookie *> * cookiesDic;

/**
 *  是否允许抓包(默认允许抓包)
 */
@property (nonatomic, assign) BOOL allowSniffer;

/**
 *  是否信任非法证书(偶然不信任)
 */
@property (nonatomic, assign) BOOL allowInvalidCer;

/**
 *  是否在证书域字段中验证域名(偶然不验证)
 */
@property (nonatomic, assign) BOOL allowValidateDomain;



/**
 *  失败默认是要弹框，提供不弹框生成器
 *
 *  @return
 */
+(nonnull instancetype)getNoneAlertCondition;
@end

NS_ASSUME_NONNULL_END
