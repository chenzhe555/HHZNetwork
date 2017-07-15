//
//  HHZHttpManagerFactory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpManagerFactory.h"

@implementation HHZHttpManagerFactory

+(id)getHHZHttpManager:(NSString *)managerName
{
    //如果为nil或者没传类名，则返回默认的Manager类
    if (managerName == nil || managerName.length == 0) return [HHZHttpManager shareManager];
    
    return nil;
}


@end
