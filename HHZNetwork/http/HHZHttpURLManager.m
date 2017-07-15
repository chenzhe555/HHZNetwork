//
//  HHZHttpURLManager.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/29.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpURLManager.h"

@interface HHZHttpURLManager()
/**
 *  存放URL地址的字典
 */
@property (nonatomic, strong) NSMutableDictionary * urlDic;

@end

@implementation HHZHttpURLManager
+(instancetype)shareManager
{
    static HHZHttpURLManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HHZHttpURLManager alloc] init];
    });
    return manager;
}

-(instancetype)init
{
    if (self = [super init]) {
        self.urlDic = [[NSMutableDictionary alloc] init];
        
        /**
         *  1.先从缓存中读取请求地址,除非有服务器接口强制要求取本地，否则都是先读缓存
         */
        NSDictionary * dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"HHZ_serviceURLDictionary"];
        if (!dic && (dic.allKeys.count != 0)) {
            for (NSString * key in dic) {
                [self.urlDic setObject:dic[key] forKey:key];
            }
        }
        
        /**
         *  2.然后再在本地设置请求地址们.
         */
        [self pushURL:[self getCommonComleteURL:@"/chenzhe/test"] Key:@"testUrl"];
    }
    return self;
}

-(NSString *)getComleteURL:(NSString *)domain Suffix:(NSString *)suffix
{
    return [NSString stringWithFormat:@"%@%@",domain,suffix];
}

-(NSString *)getCommonComleteURL:(NSString *)suffix
{
    return [NSString stringWithFormat:@"%@%@",@"https://chenzhe/test",suffix];
}

-(void)pushURL:(NSString *)httpURL Key:(NSString *)key
{
    //如果已经有相应的Key值存在，则不赋值
    if (![self.urlDic.allKeys containsObject:key]) {
        [self.urlDic setObject:httpURL forKey:key];
    }
}

-(void)setHttpRequestURL:(NSDictionary *)dic
{
    if (!dic && (dic.allKeys.count != 0)) {
        for(NSString * key in dic) {
            [self.urlDic setObject:dic[key] forKey:key];
        }
        
        //暂时先用UserDefaults缓存下.
        [[NSUserDefaults standardUserDefaults] setObject:self.urlDic.mutableCopy forKey:@"HHZ_serviceURLDictionary"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}




#pragma mark 业务自行设置网络请求参数

-(NSString *)getTestUrl
{
    return self.urlDic[@"testUrl"];
}




@end
