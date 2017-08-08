//
//  HHZPathTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZPathTool : NSObject
/**
 *  传入文件名，获取Document根目录下的文件地址
 *
 *  @param fileName 文件名称
 *
 *  @return
 */
+(NSString *)getDocumentPath:(NSString *)fileName;

/**
 *  传入文件名，获取Cache根目录下的文件地址
 *
 *  @param fileName 文件名称
 *
 *  @return
 */
+(NSString *)getCathePath:(NSString *)fileName;

/**
 *  传入文件名，删除某文件地址路径下所有文件夹
 *
 *  @param filePath 要删除的目录地址
 *
 *  @return
 */
+(BOOL)deleteAllChildForPath:(NSString *)filePath;
@end

NS_ASSUME_NONNULL_END
