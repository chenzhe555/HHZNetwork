//
//  HHZHttpManager.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZHttpManager : AFHTTPSessionManager

/**
 *  获取Http单例
 *
 *  @return 
 */
+(nonnull instancetype)shareManager;

/**
 *  获取主机IP
 *
 *  @return 
 */
-(nullable NSString *)getBaseHttpUrl;

@end


NS_ASSUME_NONNULL_END
