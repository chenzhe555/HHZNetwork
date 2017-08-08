//
//  HHZKitTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZKitTool : NSObject
/**
 *  获取当前显示的主视图
 *
 *  @return
 */
+(UIWindow *)getMainWindow;

/**
 *  改变顶部状态栏颜色
 *
 *  @param color 颜色值
 */
//+(void)changeTopStateBarColor:(UIColor *)color;

/**
 *  获取项目Info信息,例如:
 BuildMachineOSBuild = 15A284;
 CFBundleDevelopmentRegion = en;
 CFBundleExecutable = "iOS-HHZUniversal";
 CFBundleIdentifier = "com.chenzhe.haohaizi";
 CFBundleInfoDictionaryVersion = "6.0";
 CFBundleInfoPlistURL = "Info.plist -- file:///Users/陈哲#376811578@qq.com/Library/Developer/CoreSimulator/Devices/847DF976-39E6-45D3-8951-7F7B5E08BEB2/data/Containers/Bundle/Application/39FF543C-F015-4841-85B4-C12DAD442CCE/iOS-HHZUniversal.app/";
 CFBundleName = "iOS-HHZUniversal";
 CFBundleNumericVersion = 16809984;
 CFBundlePackageType = APPL;
 CFBundleShortVersionString = "1.0";
 CFBundleSignature = "?";
 CFBundleSupportedPlatforms =     (
 iPhoneSimulator
 );
 CFBundleVersion = 1;
 DTCompiler = "com.apple.compilers.llvm.clang.1_0";
 DTPlatformBuild = "";
 DTPlatformName = iphonesimulator;
 DTPlatformVersion = "9.3";
 DTSDKBuild = 13E230;
 DTSDKName = "iphonesimulator9.3";
 DTXcode = 0731;
 DTXcodeBuild = 7D1014;
 LSRequiresIPhoneOS = 1;
 MinimumOSVersion = "7.0";
 UIDeviceFamily =     (
 1
 );
 UILaunchStoryboardName = LaunchScreen;
 UIMainStoryboardFile = Main;
 UIRequiredDeviceCapabilities =     (
 armv7
 );
 UISupportedInterfaceOrientations =     (
 UIInterfaceOrientationPortrait
 );
 *
 *  @param infoKey
 *
 *  @return
 */
+(id)getProjectInfo:(NSString *)infoKey;
@end

NS_ASSUME_NONNULL_END
