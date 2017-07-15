//
//  HHZApplicationTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZApplicationTool : NSObject
/**
 *  获取当前app版本号
 *
 *  @return
 */
+(NSString *)getAppVersion;

/**
 *  获取当前app Build版本号
 *
 *  @return
 */
+(NSString *)getAppBuildVersion;

/**
 *  获取当前app BundleID
 *
 *  @return
 */
+(NSString *)getAppBundleID;

/**
 *  获取当前app BundleName
 *
 *  @return
 */
+(NSString *)getAppBundleName;

/**
 *  是否从AppStore下载的
 *
 *  @return
 */
+(BOOL)appIsPirated;

// Returns YES in App Extension.(出自YYKit)
+ (BOOL)isAppExtension;

// Same as sharedApplication, but returns nil in App Extension.(出自YYKit)
+ (nullable UIApplication *)sharedExtensionApplication;
@end

NS_ASSUME_NONNULL_END
