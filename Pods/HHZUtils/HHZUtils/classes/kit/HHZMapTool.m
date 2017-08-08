//
//  HHZMapTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZMapTool.h"
#import <UIKit/UIApplication.h>

@implementation HHZMapTool
+(BOOL)canOpenAppleMap
{
    NSURL * url = [NSURL URLWithString:@"http://maps.apple.com/"];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

+(BOOL)canOpenBaiduMap
{
    NSURL * url = [NSURL URLWithString:@"baidumap://"];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

+(BOOL)canOpenGaodeMap
{
    NSURL * url = [NSURL URLWithString:@"iosamap://"];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

+(BOOL)canOpenGoogleMap
{
    NSURL * url = [NSURL URLWithString:@"comgooglemaps://"];
    return [[UIApplication sharedApplication] canOpenURL:url];
}
@end
