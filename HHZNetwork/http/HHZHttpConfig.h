//
//  HHZHttpConfig.h
//  HHZNetwork
//
//  Created by 陈哲是个好孩子 on 2017/11/20.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHZHttpConfig : NSObject
+(instancetype)shareManager;

@property (nonatomic,assign) BOOL printHeaders;
@end
