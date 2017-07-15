//
//  HHZDeviceTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZDeviceTool : NSObject
/**
 *  获取当前app版本号
 *
 *  @return app版本号
 */
+(NSString *)getCurrentVersion;

/**
 *  获取当前手机硬件型号:
 @"i386" on the simulator
 @"iPod1,1" on iPod Touch
 @"iPod2,1" on iPod Touch Second Generation
 @"iPod3,1" on iPod Touch Third Generation
 @"iPod4,1" on iPod Touch Fourth Generation
 @"iPhone1,1" on iPhone
 @"iPhone1,2" on iPhone 3G
 @"iPhone2,1" on iPhone 3GS
 @"iPad1,1" on iPad
 @"iPad2,1" on iPad 2
 @"iPad3,1" on 3rd Generation iPad
 @"iPhone3,1" on iPhone 4
 @"iPhone4,1" on iPhone 4S
 @"iPhone5,1" on iPhone 5 (model A1428, AT&T/Canada)
 @"iPhone5,2" on iPhone 5 (model A1429, everything else)
 @"iPad3,4" on 4th Generation iPad@"iPad2,5" on iPad Mini
 @"iPhone5,3" on iPhone 5c (model A1456, A1532 | GSM)
 @"iPhone5,4" on iPhone 5c (model A1507, A1516, A1526 (China), A1529 | Global)
 @"iPhone6,1" on iPhone 5s (model A1433, A1533 | GSM)
 @"iPhone6,2" on iPhone 5s (model A1457, A1518, A1528 (China), A1530 | Global)
 @"iPad4,1" on 5th Generation iPad (iPad Air) - Wifi
 @"iPad4,2" on 5th Generation iPad (iPad Air) - Cellular
 @"iPad4,4" on 2nd Generation iPad Mini - Wifi
 @"iPad4,5" on 2nd Generation iPad Mini - Cellular
 iPhone7,1  iphone6Plus
 iPhone7,2  iphone6
 
 @"i386" @"x86_64"      都是指的模拟器
 
 型号网站:
 http://theiphonewiki.com/wiki/IPhone
 http://theiphonewiki.com/wiki/IPad
 *
 *  @return
 */
+(NSString *)getPhoneType;

/**
 *  获取当前手机系统版本号
 *
 *  @return
 */
+(NSString *)getDeviceSystemVersion;

/**
 *  获取手机的UUID
 *
 *  @return
 */
+(NSString *)getPhoneUUID;

/**
 *  判断是否是IPad
 *
 *  @return
 */
+(BOOL)isPad;

/**
 *  判断是否是模拟器
 *
 *  @return 
 */
+(BOOL)isSimulator;

/**
 *  判断是否能打电话
 *
 *  @return 
 */
+(BOOL)canMakePhoneCalls;

/**
 *  Wifi的IP (WIFI IP address of this device @"192.168.1.111")
 *
 *  @return
 */
+(nullable NSString *)IPAddressWithWifi;

/**
 *  Cell的IP 对外的外网地址 (Cell IP address of this device @"10.2.2.222")
 *
 *  @return
 */
+(nullable NSString *)IPAddressWithCell;

#pragma mark 越狱相关  查询IP导入SNFoundation
///**
// *  当前手机是否越狱
// *
// *  @return
// */
//+(BOOL)isPrisonBreak;
//
///**
// *  当前越狱版本
// *
// *  @return
// */
//+(NSString *)prisonBreakVersion;
//
///**
// *  本地IP
// *
// *  @return
// */
//+(NSString *)localIPAddress;

#pragma mark 磁盘 内存 CPU等信息
//获取磁盘信息 异常返回 -1 (具体细节可自行查询)
+(int64_t)getDiskSpace;
+(int64_t)getDiskFreeSpace;
+(int64_t)getDiskUsedSpace;

//获取内存信息 异常返回 -1 (具体细节可自行查询)
+(int64_t)getTotalMemory;
+(int64_t)getUsedMemory;
+(int64_t)getFreeMemory;
+(int64_t)getActiveMemory;
//闲置的
+(int64_t)getInactiveMemory;
//wired是系统核心占用的，永远不会从系统物理[内存]种驱除。
+(int64_t)getWiredMemory;
//便携式存储器
+(int64_t)getPurgableMemory;


//获取CPU信息 异常返回 -1 (具体细节可自行查询)
// Avaliable CPU processor count.
+(NSUInteger)getCPUCount;
//Current CPU usage, 1.0 means 100%. (-1 when error occurs)
+(CGFloat)getCPUUsage;
@end

NS_ASSUME_NONNULL_END
