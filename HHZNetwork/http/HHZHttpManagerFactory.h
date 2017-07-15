//
//  HHZHttpManagerFactory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

//这是考虑多个主机地址请求的情况，工厂模式
#import "HHZHttpManager.h"

NS_ASSUME_NONNULL_BEGIN


@interface HHZHttpManagerFactory : NSObject

/**
 *  获取默认的Manager管理类
 *
 *  @return 
 */
+(nullable id)getHHZHttpManager:(NSString *)managerName;

@end

NS_ASSUME_NONNULL_END
