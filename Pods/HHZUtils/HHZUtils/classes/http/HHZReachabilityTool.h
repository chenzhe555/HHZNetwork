//
//  HHZReachabilityTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HHZReachabilityType) {
    HHZReachabilityTypeNone = 555,    //无网络
    HHZReachabilityTypeWWAN,    //蜂窝网络
    HHZReachabilityTypeWIFI     //无线网
};

typedef NS_ENUM(NSUInteger, HHZReachabilityWWANStatus) {
    HHZReachabilityWWANStatusNone = 666,      //无网络
    HHZReachabilityWWANStatus2G,        //2G
    HHZReachabilityWWANStatus3G,        //3G
    HHZReachabilityWWANStatus4G,        //4G
    HHZReachabilityWWANStatus5G,        //5G
};

@interface HHZReachabilityTool : NSObject
@property (nonatomic, readonly) SCNetworkReachabilityFlags flags;
/**
 *  当前网络环境
 */
@property (nonatomic, readonly) HHZReachabilityType status;
/**
 *  WWAN类型
 */
@property (nonatomic, readonly) HHZReachabilityWWANStatus WWANStatus;
/**
 *  是否有网
 */
@property (nonatomic, readonly) BOOL reachable;
/**
 *  回调
 */
@property (nullable, nonatomic, copy) void (^notifyBlock)(HHZReachabilityTool * reachability);
/**
 *  创建一个默认路由的连接
 *
 *  @return
 */
+(instancetype)reachability;
/**
 *  创建本地Wifi的连接
 *
 *  @return
 */
+(instancetype)reachabilityForLocalWifi;
/**
 *  创建指定Host的连接
 *
 *  @param hostname 主机地址
 *
 *  @return
 */
+(nullable instancetype)reachabilityWithHostname:(NSString *)hostname;
/**
 *  创建指定IP的连接
 *
 *  @param hostAddress IP地址
 *
 *  @return 
 */
+(nullable instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;
@end

NS_ASSUME_NONNULL_END
