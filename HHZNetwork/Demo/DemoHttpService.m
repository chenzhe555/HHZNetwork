//
//  DemoHttpService.m
//  HHZNetwork
//
//  Created by 陈哲是个好孩子 on 2017/7/16.陈哲
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "DemoHttpService.h"
#import "DemoHttpURLManager.h"

@implementation DemoHttpService

#pragma mark 重载网络请求处理
/**
 *  处理请求服务器成功返回的数据
 *
 *  @param responseObject 服务器返回的数据
 */
-(void)manageServiceSuccess:(HHZHttpResponse *)responseObject
{
#ifdef DEBUG
    NSLog(@"<服务器返回参数:%lu>\n%@\n",(unsigned long)responseObject.tag,responseObject.requestUrl);
#endif
    
    NSString * codeStr = [NSString stringWithFormat:@"%@",[((HHZHttpResponse *)responseObject).object objectForKey:@"ret"]];
    if ([codeStr isEqualToString:@"1"])
    {
        if(_delegate && [_delegate respondsToSelector:@selector(requestSuccess:)])
        {
            [_delegate performSelector:@selector(requestSuccess:) withObject:responseObject];
        }
    }
    else
    {
        ((HHZHttpResponse *)responseObject).isRequestSuccessFail = YES;
        if (_delegate && [_delegate respondsToSelector:@selector(requestFail:)])
        {
            [_delegate performSelector:@selector(requestFail:) withObject:responseObject];
        }
    }
}

/**
 *  处理因网络情况导致的网络失败请求
 *
 */
-(void)manageServiceFail:(HHZHttpResponse *)responseObject
{
    responseObject.isRequestSuccessFail = NO;
    if (_delegate && [_delegate respondsToSelector:@selector(requestFail:)])
    {
        [_delegate performSelector:@selector(requestFail:) withObject:responseObject];
    }
}

-(void)handleFailInfo:(HHZHttpResponse *)responeseObject
{
    if (responeseObject.isRequestSuccessFail)
    {
        [self handleHttpSuccessErrorInfo:responeseObject];
    }
    else
    {
        [self handleHttpFailInfo:responeseObject];
    }
}

-(void)handleHttpSuccessErrorInfo:(HHZHttpResponse *)response
{
    [self showErrorTitle:response.object[@"error"][@"errorTitle"] msg:[NSString stringWithFormat:@"%@",response.object[@"error"][@"errorMsg"]] code:[NSString stringWithFormat:@"%@",response.object[@"error"][@"errorCode"]] errorType:response.alertType];
}

-(void)handleHttpFailInfo:(HHZHttpResponse *)response
{
    [self showErrorTitle:nil msg:@"网络不给力,请稍候重试!" code:@"000000" errorType:response.alertType];
}

-(void)showErrorTitle:(NSString *)title msg:(NSString *)errorMsg code:(NSString *)errorCode errorType:(HHZHttpAlertType)type
{
    if (title.length == 0) title = @"网络请求失败";
    switch (type)
    {
        case HHZHttpAlertTypeNone:
        {
            
        }
            break;
        case HHZHttpAlertTypeNative:
        {
            // 弹Alert框
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:errorMsg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }
            break;
        case HHZHttpAlertTypeToast:
        {
            // 弹Toast框
        }
            break;
            
        default:
            break;
    }
}


-(void)manageBeforeSendRequest:(HHZHttpRequest *)request condition:(HHZHttpRequestCondition *) condition
{
    if (_delegate && [_delegate respondsToSelector:@selector(beforeSendRequest:appendCondition:)])
    {
        [_delegate beforeSendRequest:request appendCondition:condition];
    }
}



#pragma mark

-(HHZHttpResult *)testHttpRequestArg1:(NSString *)arg1 Arg2:(NSUInteger)arg2 Condition:(HHZHttpRequestCondition *)condition
{
    if (!condition) condition = [[HHZHttpRequestCondition alloc] init];
    
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    
    [parameters setObject:@"18911684025" forKey:@"username"];
    [parameters setObject:@(arg2) forKey:@"two"];
    
    
    HHZHttpRequest * request = [[HHZHttpRequest alloc] init];
    request.paramaters = parameters;
    request.url = [[DemoHttpURLManager shareManager] getTest1URL];
    
    request.url = @"https://wx.kj521.com/rhcrm/index.php/home/appios/get_appios_config";
    
    __weak typeof(self) weakSelf = self;
    return [HHZHttpClient sendRequest:request appendCondition:condition success:^(HHZHttpResponse * _Nonnull responseObject) {
        [weakSelf manageServiceSuccess:responseObject];
    } fail:^(HHZHttpResponse * _Nonnull responseObject) {
        [weakSelf manageServiceFail:responseObject];
    } beforeSend:^(HHZHttpRequest * _Nonnull request, HHZHttpRequestCondition * _Nonnull condition) {
        [weakSelf manageBeforeSendRequest:request condition:condition];
    }];
}


@end
