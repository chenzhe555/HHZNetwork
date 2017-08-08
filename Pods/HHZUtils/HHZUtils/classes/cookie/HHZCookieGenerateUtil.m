//
//  HHZCookieGenerateUtil.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 17/1/3.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCookieGenerateUtil.h"

@implementation HHZCookieGenerateUtil
+(NSHTTPCookie *)generateCookieName:(NSString *)cookieName Value:(NSString *)cookieValue Domain:(NSString *)cookieDomain Path:(NSString *)cookiePath Expires:(NSTimeInterval)expires
{
    NSMutableDictionary * cookiePropertie = [NSMutableDictionary dictionary];
    [cookiePropertie setObject:cookieName forKey:NSHTTPCookieName];
    [cookiePropertie setObject:cookieValue forKey:NSHTTPCookieValue];
    [cookiePropertie setObject:cookieDomain forKey:NSHTTPCookieDomain];
    [cookiePropertie setObject:cookiePath forKey:NSHTTPCookiePath];
    [cookiePropertie setObject:[[NSDate date] dateByAddingTimeInterval:expires] forKey:NSHTTPCookieExpires];
    return [NSHTTPCookie cookieWithProperties:cookiePropertie];
}
@end
