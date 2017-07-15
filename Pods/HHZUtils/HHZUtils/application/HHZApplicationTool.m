//
//  HHZApplicationTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZApplicationTool.h"

@implementation HHZApplicationTool
+(NSString *)getAppVersion
{
    return  [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
}

+(NSString *)getAppBuildVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+(NSString *)getAppBundleName
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

+(NSString *)getAppBundleID
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

+(BOOL)appIsPirated
{
#if TARGET_OS_SIMULATOR
    return YES;
#else
    if (getgid() <= 10) return YES; // process ID shouldn't be root
    
    if ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"SignerIdentity"]) {
        return YES;
    }
    
    if (![self fileExistInMainBundle:@"_CodeSignature"]) {
        return YES;
    }
    
    if (![self fileExistInMainBundle:@"SC_Info"]) {
        return YES;
    }
    
    //if someone really want to crack your app, this method is useless..
    //you may change this method's name, encrypt the code and do more check..
    return NO;
#endif
    
    
}

+(BOOL)fileExistInMainBundle:(NSString *)name
{
    NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], name];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+(BOOL)isAppExtension
{
    static BOOL isAppExtension;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"UIApplication");
        if(!cls || ![cls respondsToSelector:@selector(sharedApplication)]) isAppExtension = YES;
        if ([[[NSBundle mainBundle] bundlePath] hasSuffix:@".appex"]) isAppExtension = YES;
    });
    return isAppExtension;
}

+(UIApplication *)sharedExtensionApplication
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    return [self isAppExtension] ? nil : [UIApplication performSelector:@selector(sharedApplication)];
#pragma clang diagnostic pop
}
@end
