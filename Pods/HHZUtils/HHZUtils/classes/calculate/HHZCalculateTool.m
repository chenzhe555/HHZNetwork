//
//  HHZCalculateTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCalculateTool.h"
#import <UIKit/UIFont.h>
#import <UIKit/NSStringDrawing.h>

@implementation HHZCalculateTool
+(CGSize)getLabelActualSizeWithString:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth
{
    return [self getLabelActualSizeWithString:str andFont:fontSize andLines:lines andlabelWidth:labelWidth andFontName:@""];
}

+(CGSize)getLabelActualSizeWithString:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth andFontName:(NSString *)fontName
{
    CGSize lineSize = [self getLineHeightSizeString:str Font:fontSize FontName:fontName];
    CGSize allSize = [self getAllHeightSizeString:str Font:fontSize LabelWidth:labelWidth];
    return [self getActualSize:lineSize AllSize:allSize Lines:lines LabelWidth:labelWidth];
}

/**
 *  获取每一行高度
 *
 *  @param str
 *  @param fontSize
 *  @param fontName
 *
 *  @return
 */
+(CGSize)getLineHeightSizeString:(NSString *)str Font:(CGFloat)fontSize FontName:(NSString *)fontName
{
    //字体为加粗
    if ([fontName isEqualToString:@".SFUIText-Semibold"]) {
        return [str sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont boldSystemFontOfSize:fontSize] forKey:NSFontAttributeName]];
    }
    return [str sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName]];
}

/**
 *  获取文字整体的高度
 *
 *  @param str
 *  @param fontSize
 *  @param labelWidth
 *
 *  @return
 */
+(CGSize)getAllHeightSizeString:(NSString *)str Font:(CGFloat)fontSize LabelWidth:(CGFloat)labelWidth
{
    return [str boundingRectWithSize:CGSizeMake(labelWidth, 1000000) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil].size;
}

/**
 *  跟传入的行数作比较进行返回值
 *
 *  @param lineSize
 *  @param allSize
 *  @param lines
 *  @param labelWidth
 *
 *  @return 
 */
+(CGSize)getActualSize:(CGSize)lineSize AllSize:(CGSize)allSize Lines:(NSInteger)lines LabelWidth:(CGFloat)labelWidth
{
    if (allSize.width <= 0)
    {
        return CGSizeMake(labelWidth, 0);
    }
    else
    {
        if (lines == 0)
        {
            if (allSize.width < labelWidth) labelWidth = allSize.width;
            return CGSizeMake(labelWidth,allSize.height);
        }
        else
        {
            NSInteger labelLines = (int)(allSize.height/lineSize.height);
            if (labelLines >= lines) return CGSizeMake(labelWidth, lines * lineSize.height);
            return CGSizeMake(labelWidth, labelLines * lineSize.height);
        }
    }
}

@end
