//
//  HHZNumericalTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 17/1/3.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZNumericalTool.h"

typedef NS_ENUM(NSInteger,HHZNumericalToolType){
    HHZNumericalToolTypeAdd = 110,
    HHZNumericalToolTypeSubtract,
    HHZNumericalToolTypeMultiply,
    HHZNumericalToolTypeDivid
};


@implementation HHZNumericalTool
+(NSDecimalNumber *)addNumbers:(NSObject *)numbers, ...
{
    va_list nums;
    va_start(nums, numbers);
    NSDecimalNumber * result = [self handleNumbersType:HHZNumericalToolTypeAdd Numbers:numbers Args:nums];
    va_end(nums);
    return result;
}

+(NSDecimalNumber *)subtractNumbers:(NSObject *)numbers, ...
{
    va_list nums;
    va_start(nums, numbers);
    NSDecimalNumber * result = [self handleNumbersType:HHZNumericalToolTypeSubtract Numbers:numbers Args:nums];
    va_end(nums);
    return result;
}

+(NSDecimalNumber *)multiplyNumbers:(NSObject *)numbers, ...
{
    va_list nums;
    va_start(nums, numbers);
    NSDecimalNumber * result = [self handleNumbersType:HHZNumericalToolTypeMultiply Numbers:numbers Args:nums];
    va_end(nums);
    return result;
}

+(NSDecimalNumber *)dividNumbers:(NSObject *)numbers, ...
{
    va_list nums;
    va_start(nums, numbers);
    NSDecimalNumber * result = [self handleNumbersType:HHZNumericalToolTypeDivid Numbers:numbers Args:nums];
    va_end(nums);
    return result;
}

+(NSDecimalNumber *)handleNumbersType:(HHZNumericalToolType)type Numbers:(NSObject *)numbers Args:(va_list)nums
{
    NSDecimalNumber * total = [NSDecimalNumber decimalNumberWithString:@"0"];
    if (numbers)
    {
        @try {
            //先与第一个参数相加
            total = [total decimalNumberByAdding:[NSDecimalNumber decimalNumberWithString:[self getStringNumber:numbers]]];
            NSObject * str = nil;
            
            //获取其它参数并相加
            while ((str = va_arg(nums, NSObject *)))
            {
                NSDecimalNumber * num = [NSDecimalNumber decimalNumberWithString:[self getStringNumber:str]];
                switch (type) {
                    case HHZNumericalToolTypeAdd: {
                        total = [total decimalNumberByAdding:num];
                        break;
                    }
                    case HHZNumericalToolTypeSubtract: {
                        total = [total decimalNumberBySubtracting:num];
                        break;
                    }
                    case HHZNumericalToolTypeMultiply: {
                        total = [total decimalNumberByMultiplyingBy:num];
                        break;
                    }
                    case HHZNumericalToolTypeDivid: {
                        total = [total decimalNumberByDividingBy:num];
                        break;
                    }
                }
                
            }
        } @catch (NSException *exception) {
            
        }
    }
    
    //释放可变参数的指针
    va_end(nums);
    
    return total;
}

+(NSString *)getStringNumber:(NSObject *)obj
{
    return [NSString stringWithFormat:@"%@",obj];
}
@end
