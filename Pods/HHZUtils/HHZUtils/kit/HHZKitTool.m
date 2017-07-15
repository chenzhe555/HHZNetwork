//
//  HHZKitTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZKitTool.h"

@implementation HHZKitTool
+(UIWindow *)getMainWindow
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    if (!window)
    {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    return window;
}

//+(void)changeTopStateBarColor:(UIColor *)color
//{
//    UIApplication * app = [UIApplication sharedApplication];
//    id obj = [app valueForKeyPath:@"statusBar"];
//    NSArray * arr = [obj getPrivateApiMethod];
//
//    for (int i = 0; i < arr.count; i++)
//    {
//        if ([((NSString *)[arr objectAtIndex:i]) isEqualToString:@"foregroundColor"])
//        {
//            [obj setValue:color forKey:((NSString *)[arr objectAtIndex:i])];
//        }
//    }
//}

+(id)getProjectInfo:(NSString *)infoKey
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:infoKey];
}
@end
