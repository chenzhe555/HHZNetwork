//
//  HHZHttpEnum.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 网络请求中的枚举值
 */

#import <Foundation/Foundation.h>


//针对网络请求得到结果之后弹框的方式
typedef NS_ENUM(NSInteger, HHZHttpAlertType){
    HHZHttpAlertTypeNone = 100,             //无弹框
    HHZHttpAlertTypeNative,                 //苹果自带系统弹框
    HHZHttpAlertTypeToast,                  //安卓风格的弹框
};


//responseSerializer
typedef NS_ENUM(NSInteger,HHZHttpSerializerType){
    HHZHttpSerializerType1 = 200,           //request-json,response-json
    HHZHttpSerializerType2,                 //request-json,response-http
    HHZHttpSerializerType3,                 //request-http,response-json
    HHZHttpSerializerType4,                 //request-http,response-http
};


//加密类型
typedef NS_ENUM(NSInteger,HHZEncryptionType){
    HHZEncryptionTypeNone = 300,            //无加密
    HHZEncryptionTypeMall,                  //商城
    HHZEncryptionTypeXiaoMei,               //小美
};

//http/https
typedef NS_ENUM(NSUInteger,HHZHttpProtocalType) {
    HHZHttpProtocalTypeHTTP = 400,
    HHZHttpProtocalTypeHTTPS
};

