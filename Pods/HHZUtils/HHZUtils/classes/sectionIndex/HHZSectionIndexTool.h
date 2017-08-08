//
//  HHZSectionIndexTool.h
//  HHZUtils
//
//  Created by 陈哲是个好孩子 on 2017/8/3.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HHZSectionIndexGenerateComplete) (NSArray * _Nullable sectionArr,NSArray * _Nullable sectionIndexArr);

NS_ASSUME_NONNULL_BEGIN

@interface HHZSectionIndexTool : NSObject
+(void)generateSectionIndex:(NSArray *)sortArray sortKey:(NSString *)sortKey completeBlock:(HHZSectionIndexGenerateComplete)completeBlock;
@end

NS_ASSUME_NONNULL_END
