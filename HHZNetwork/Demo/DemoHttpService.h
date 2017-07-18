//
//  DemoHttpService.h
//  HHZNetwork
//
//  Created by 陈哲是个好孩子 on 2017/7/16.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpService.h"

@interface DemoHttpService : HHZHttpService
@property (nonatomic, assign) id<HHZHttpServiceDelegate> delegate;

-(HHZHttpResult *)testHttpRequestArg1:(NSString *)arg1 Arg2:(NSUInteger)arg2 Condition:(HHZHttpRequestCondition *)condition;

@end
