//
//  HHZDateTool_Format.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZDateTool_Format.h"

@implementation HHZDateTool_Year

+(instancetype)shareDateFommat
{
    static HHZDateTool_Year * tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[HHZDateTool_Year alloc] init];
        tool.fommat = [[NSDateFormatter alloc] init];
        tool.fommat.dateFormat = @"yyyy-MM-dd";
    });
    
    return tool;
}

@end

@implementation HHZDateTool_Time
+(instancetype)shareDateFommat
{
    static HHZDateTool_Time * tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[HHZDateTool_Time alloc] init];
        tool.fommat = [[NSDateFormatter alloc] init];
        tool.fommat.dateFormat = @"HH:mm:ss";
    });
    
    return tool;
}
@end

@implementation HHZDateTool_YearAndTime
+(instancetype)shareDateFommat
{
    static HHZDateTool_YearAndTime * tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[HHZDateTool_YearAndTime alloc] init];
        tool.fommat = [[NSDateFormatter alloc] init];
        tool.fommat.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    });
    
    return tool;
}
@end
