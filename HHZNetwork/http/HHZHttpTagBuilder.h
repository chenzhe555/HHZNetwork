//
//  HHZHttpTagBuilder.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HHZHttpTagBuilder : NSObject
/**
 *  获取请求Tag实例
 *
 *  @return
 */
+(nonnull instancetype)shareManager;

/**
 *  获取Tag唯一标示
 *
 *  @return
 */
-(NSUInteger)getSoleHttpTag;
@end
