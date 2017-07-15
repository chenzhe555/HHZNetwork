//
//  HHZDateToolFactory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZDateTool_Format.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHZDateToolFactory : NSObject

/**
 *  获取date格式化:yyyy-MM-dd
 *
 *  @return
 */
+(HHZDateTool_Year *)getYearFormat;

/**
 *  获取date格式化:HH:mm:ss
 *
 *  @return
 */
+(HHZDateTool_Time *)getTimeFormat;

/**
 *  获取date格式化:yyyy-MM-dd HH:mm:ss
 *
 *  @return
 */
+(HHZDateTool_YearAndTime *)getYearAndTimeFormat;
@end

NS_ASSUME_NONNULL_END
