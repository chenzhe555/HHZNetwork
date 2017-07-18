//
//  DemoHttpURLManager.m
//  HHZNetwork
//
//  Created by 陈哲是个好孩子 on 2017/7/16.陈哲
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "DemoHttpURLManager.h"

#define Base_URL "http://localhost:8080"

@implementation DemoHttpURLManager
-(void)loadURLs
{
    [super loadURLs];
    
    //接口地址
    [self pushURL:[self getBaseUrls:@"/a/b"] Key:@"test1"];
    [self pushURL:[self getBaseUrls:@"/b/c"] Key:@"test2"];
}

-(NSString *)getBaseUrls:(NSString *)suffix
{
    return [NSString stringWithFormat:@"%s%@",Base_URL,suffix];
}

-(NSString *)getTest1URL
{
    return self.urlDic[@"test1"];
}
@end
