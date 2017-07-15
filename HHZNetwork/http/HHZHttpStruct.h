//
//  HHZHttpStruct.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 网络请求以及响应的结构体
 */



#import "HHZHttpEnum.h"

NS_ASSUME_NONNULL_BEGIN
/**
 *  网络请求接口数据结构
 */
@interface HHZHttpRequest : NSObject

/**
 *  请求方式:GET,POST,PUT,DELETE,HEAD,OPTIONS
 */
@property (nonatomic, copy) NSString * requestMethod;

/**
 *  请求参数
 */
@property (nonatomic, strong) NSMutableDictionary * paramaters;

/**
 *  请求的服务器地址
 */
@property (nonatomic, copy) NSString * url;

/**
 *  请求的超时
 */
@property (nonatomic, assign) NSInteger timeOut;

/**
 *  请求参数是否加密
 */
@property (nonatomic, assign) HHZEncryptionType encryptionType;

/**
 *  是否需要Token(与后台协商的唯一标识)
 */
@property (nonatomic, assign) BOOL isNeedToken;

/**
 *  针对特定网络请求Service，设置请求失败后的弹框提示类型
 */
@property (nonatomic, assign) HHZHttpAlertType alertType;

/**
 *  请求头的字典@{@"":@""}
 */
@property (nonatomic, strong) NSDictionary * headerDic;

/**
 *  下载文件的保存地址
 */
@property (nonatomic, copy) NSString * savePath;

@end


/**
 *  网络请求回调数据结构
 */
@interface HHZHttpResponse : NSObject
/**
 *  进行网络请求时传入的tag值，用于标识是哪个Service请求
 */
@property (nonatomic, assign) NSUInteger tag;

/**
 *  AF框架返回的服务器数据
 */
@property (nonatomic, strong) id object;

/**
 *  无论网络失败还是网络请求成功但是返回异常，错误信息都是在errorInfo里面
 */
@property (nonatomic, strong) NSError * errorInfo;

/**
 *  判断是网络请求成功获取服务器返回的失败还是未连接到服务器请求回来的失败 yes代表服务器返回的失败 no代表就是纯粹网络失败
 */
@property (nonatomic, assign) BOOL isRequestSuccessFail;

/**
 *  针对特定网络请求Service，设置请求失败后的弹框提示类型
 */
@property (nonatomic, assign) HHZHttpAlertType alertType;

/**
 *  返回数据的服务器地址
 */
@property (nonatomic, copy) NSString * requestUrl;

@end


@interface HHZHttpResult : NSObject
/**
 *  进行网络请求时传入的tag值，用于标识是哪个Service请求
 */
@property (nonatomic, assign) NSUInteger tag;

/**
 *  请求的地址
 */
@property (nonatomic, copy) NSString * requestURL;

/**
 *  网络请求的Task，可以进行自定义操作(暂时先不提供细节操作，自行先处理，比如取消请求等)
 */
@property (nonatomic, strong) NSURLSessionDataTask * requestTask;

/**
 *  生成默认的结果
 *
 *  @return 
 */
+(HHZHttpResult *)generateDefaultResult:(NSUInteger)tag RequestURL:(NSString *)url Task:(NSURLSessionDataTask *)task;

@end


NS_ASSUME_NONNULL_END
