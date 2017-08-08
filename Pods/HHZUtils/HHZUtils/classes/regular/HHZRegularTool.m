//
//  HHZRegularTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZRegularTool.h"

@implementation HHZRegularTool
+(BOOL)matchingWithMatchingString:(NSString *)matchString andRegularExpression:(NSString *)expression
{
    NSPredicate * regularPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    return [regularPredicate evaluateWithObject:matchString];
}

+(BOOL)matchingPhoneNumber:(NSString *)phone
{
    return [self matchingWithMatchingString:phone andRegularExpression:@"^1[3-8]\\d{9}$"];
}

+(BOOL)matchingEmailNumber:(NSString *)email
{
    return [self matchingWithMatchingString:email andRegularExpression:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}

+(BOOL)matchingIdentityCard:(NSString *)identityCard
{
    return [self matchingWithMatchingString:identityCard andRegularExpression:@"^(\\d{14}|\\d{17})(\\d|[xX])$"];
}

+(BOOL)isEmptyOrAllSpace:(NSString *)str
{
    if (str)
    {
        NSString * trimedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] != 0) return false;
    }
    return true;
}
@end
