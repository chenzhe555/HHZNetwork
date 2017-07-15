//
//  HHZMapTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZMapTool : NSObject
#pragma mark 检查当前手机是否能打开相应地图应用
/**
 *  是否能打开系统自带地图
 *
 *  @return
 */
+(BOOL)canOpenAppleMap;

/**
 *  是否能打开百度地图
 *
 *  @return
 */
+(BOOL)canOpenBaiduMap;

/**
 *  是否能打开高德地图
 *
 *  @return
 */
+(BOOL)canOpenGaodeMap;

/**
 *  是否能打开谷歌地图
 *
 *  @return
 */
+(BOOL)canOpenGoogleMap;
@end

NS_ASSUME_NONNULL_END
