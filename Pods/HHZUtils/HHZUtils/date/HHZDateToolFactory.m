//
//  HHZDateToolFactory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZDateToolFactory.h"

@implementation HHZDateToolFactory
+(HHZDateTool_Year *)getYearFormat
{
    return [HHZDateTool_Year shareDateFommat];
}

+(HHZDateTool_Time *)getTimeFormat
{
    return [HHZDateTool_Time shareDateFommat];
}

+(HHZDateTool_YearAndTime *)getYearAndTimeFormat
{
    return [HHZDateTool_YearAndTime shareDateFommat];
}
@end
