//
//  HHZSectionIndexTool.m
//  HHZUtils
//
//  Created by 陈哲是个好孩子 on 2017/8/3.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZSectionIndexTool.h"

@implementation HHZSectionIndexTool
+(void)generateSectionIndex:(NSArray *)sortArray sortKey:(NSString *)sortKey completeBlock:(HHZSectionIndexGenerateComplete)completeBlock
{
    //获得当前UILocalizedIndexedCollation对象
    UILocalizedIndexedCollation * collation = [UILocalizedIndexedCollation currentCollation];
    //获取当前区域的字母总数量 (A-Z)+(#) 27个
    NSInteger index = [collation sectionTitles].count;
    
    //初始化总字母空数组
    NSMutableArray * allSectionArray = [[NSMutableArray alloc] initWithCapacity:index];
    for (int i = 0; i < index; ++i)
    {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        [allSectionArray addObject:arr];
    }
    
    //真正有值的数据数组
    NSMutableArray * realSectionArray = [NSMutableArray array];
    //真正有值的字母索引值数组
    NSMutableArray * realSectionIndexArray = [NSMutableArray array];
    
    //将相同首字母的放一个数组里
    for(id obj in sortArray)
    {
        NSInteger realSectionNumber = [collation sectionForObject:obj collationStringSelector:NSSelectorFromString(sortKey)];
        NSMutableArray * sectionObjs = allSectionArray[realSectionNumber];
        [sectionObjs addObject:obj];
    }
    
    //对相同首字母的数组再次进行排序
    for (int j = 0; j < index; ++j)
    {
        NSMutableArray * waitForSortArr = allSectionArray[j];
        NSArray * replaceArr = [collation sortedArrayFromArray:waitForSortArr collationStringSelector:NSSelectorFromString(sortKey)];
        //只获取有数据的数组
        if (replaceArr.count > 0)
        {
            [realSectionArray addObject:replaceArr];
            [realSectionIndexArray addObject:[collation sectionTitles][j]];
        }
    }
    
    if (completeBlock)
    {
        [completeBlock copy];
        completeBlock(realSectionArray,realSectionIndexArray);
    }
    
}
@end
