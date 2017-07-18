//
//  HHZConfig.h
//  iOS-HHZConfig
//
//  Created by 陈哲是个好孩子 on 2017/6/18.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#ifdef DEBUG
#define HHZLog(format, ...) printf("[Time:%s]\n   Method:%s\n   Line:%d--> %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define HHZLog(format, ...)
#endif



/*************************************实用小工具******************************************/
#define kUserDef [NSUserDefaults standardUserDefaults]
#define kNotification [NSNotificationCenter defaultCenter]
#define kFileManager  [NSFileManager defaultManager]
#define kMCColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]



/***************************************手机参数*******************************************/
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define kIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//iPhone4
#define kIS_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//iPhone5 5S 5C SE
#define kIS_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//iPhone6 6S 7
#define kIS_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
//iPhone6Plus 6SPlus 7Plus
#define kIS_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

//以下版本比较都属于闭区间
#define kiOS10_or_Later     [[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0f
#define kiOS9_or_Later      [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0f
#define kiOS8_or_Later      [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f
#define kiOS7_or_Later      [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f
#define kiOS6_or_Later      [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0f
#define kiOS10_or_Before	[[[UIDevice currentDevice] systemVersion] floatValue] <= 10.0f
#define kiOS9_or_Before     [[[UIDevice currentDevice] systemVersion] floatValue] <= 9.0f
#define kiOS8_or_Before     [[[UIDevice currentDevice] systemVersion] floatValue] <= 8.0f
#define kiOS7_or_Before     [[[UIDevice currentDevice] systemVersion] floatValue] <= 7.0f
#define kiOS6_or_Before     [[[UIDevice currentDevice] systemVersion] floatValue] <= 6.0f
#define kiOSBetween(arg1,arg2) [[[UIDevice currentDevice] systemVersion] floatValue] >= (float)arg1 && [[[UIDevice currentDevice] systemVersion] floatValue] <= (float)arg2




/***************************************Block*******************************************/
/**
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


#define Block_Excute(block,...) if(block) {block(__VA_ARGS__);};
