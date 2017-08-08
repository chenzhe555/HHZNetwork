//
//  HHZCookieGenerateUtil.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 17/1/3.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZCookieGenerateUtil : NSObject
/**
 *  生成Http的Cookie
 *
 *  @param cookieName   Cookie 的 Key
 *  @param cookieValue  Cookie 的 值
 *  @param cookieDomain Cookie 域名
 *  @param cookiePath   Cookie 域名下地址
 *  @param expires      过期时间
 *
 *  @return
 */
+(NSHTTPCookie *)generateCookieName:(NSString *)cookieName Value:(NSString *)cookieValue Domain:(NSString *)cookieDomain Path:(NSString *)cookiePath Expires:(NSTimeInterval)expires;
@end

NS_ASSUME_NONNULL_END
