//
//  HHZCalculateTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZCalculateTool : NSObject
#pragma mark 计算文字宽度
/**
 *  传入字符串、字体大小、行数已经限制的Width获取返回Label的Size。line为0代表默认多行，为其它数字表示最多lines行；限制Width代表返回的Size最大宽度为Width
 *
 *  @param str        传入计算的字符串
 *  @param fontSize   字体大小
 *  @param lines      限制行数
 *  @param labelWidth 限制宽度
 *
 *  @return
 */
+(CGSize)getLabelActualSizeWithString:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth;


/**
 *  正常字体以外字体的计算:传入字符串、字体大小、行数已经限制的Width获取返回Label的Size。line为0代表默认多行，为其它数字表示最多lines行；限制Width代表返回的Size最大宽度为Width
 *
 *  @param str        传入计算的字符串
 *  @param fontSize   字体大小
 *  @param lines      限制行数
 *  @param labelWidth 限制宽度
 *
 *  @return
 */
+(CGSize)getLabelActualSizeWithString:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth andFontName:(NSString *)fontName;
@end

NS_ASSUME_NONNULL_END
