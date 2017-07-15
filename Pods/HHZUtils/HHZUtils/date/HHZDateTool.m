//
//  HHZDateTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZDateTool.h"


@implementation HHZDateTool

+(instancetype)shareDateFommat
{
    return nil;
}

-(NSString *)getStringFromDate:(NSDate *)date
{
    return [self.fommat stringFromDate:date];
}

-(NSDate *)getDateFromString:(NSString *)dateString
{
    return [[self.fommat dateFromString:dateString] dateByAddingTimeInterval:[HHZDateTool getCurrentZoneInterval]];
}

+(NSTimeInterval)getCurrentZoneInterval
{
    NSTimeZone * timeZone = [NSTimeZone systemTimeZone];
    return [timeZone secondsFromGMTForDate:[NSDate date]];
}

+(NSTimeInterval)getTimeStamp
{
    return [[NSDate date] timeIntervalSince1970]*1000;
}

@end
