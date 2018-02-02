//
//  HHZHttpClient.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpClient.h"
#import "HHZHttpConfig.h"

@implementation HHZHttpClient
+(HHZHttpResult *)sendRequest:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition success:(HHZSuccessBlock)success fail:(HHZFailureBlock)fail beforeSend:( HHZBeforeSendRequest)beforeSend
{
    //生成Tag唯一标识
    NSUInteger httpTag = [[HHZHttpTagBuilder shareManager] getSoleHttpTag];
    
    //添加附加请求参数
    [self addExtraParamatersWithCondition:request];
    
    //对参数加密
    [self encryptionRequest:request];
    
    //处理Condition情况
    [self handleHttpCondition:condition];
    
    //打印参数信息
    [self handlePrintJSON:condition.printJSONType paramaters:request.paramaters url:request.url tag:httpTag isRequest:YES task:nil];
    
    //发送网络请求前的回调
    if (beforeSend) beforeSend(request,condition);
    
    NSURLSessionDataTask * getTask = nil;
    if ([request.requestMethod isEqualToString:@"GET"])
    {
        getTask = [[HHZHttpManager shareManager] GET:request.url parameters:request.paramaters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            HHZHttpResponse * reponse = [self handleSuccessResponseObject:responseObject httpTag:httpTag request:request appendCondition:condition task:task];
            if (success) success(reponse);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HHZHttpResponse * reponse = [self handleFailHttpTag:httpTag request:request appendCondition:condition task:task error:error];
            if (fail) fail(reponse);
        }];
    }
    else if ([request.requestMethod isEqualToString:@"PATCH"])
    {
        getTask = [[HHZHttpManager shareManager] PATCH:request.url parameters:request.paramaters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            HHZHttpResponse * reponse = [self handleSuccessResponseObject:responseObject httpTag:httpTag request:request appendCondition:condition task:task];
            if (success) success(reponse);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HHZHttpResponse * reponse = [self handleFailHttpTag:httpTag request:request appendCondition:condition task:task error:error];
            if (fail) fail(reponse);
        }];
    }
    else if ([request.requestMethod isEqualToString:@"DELETE"])
    {
        getTask = [[HHZHttpManager shareManager] DELETE:request.url parameters:request.paramaters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            HHZHttpResponse * reponse = [self handleSuccessResponseObject:responseObject httpTag:httpTag request:request appendCondition:condition task:task];
            if (success) success(reponse);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HHZHttpResponse * reponse = [self handleFailHttpTag:httpTag request:request appendCondition:condition task:task error:error];
            if (fail) fail(reponse);
        }];
    }
    else
    {
        getTask = [[HHZHttpManager shareManager] POST:request.url parameters:request.paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            HHZHttpResponse * reponse = [self handleSuccessResponseObject:responseObject httpTag:httpTag request:request appendCondition:condition task:task];
            if (success) success(reponse);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HHZHttpResponse * reponse = [self handleFailHttpTag:httpTag request:request appendCondition:condition task:task error:error];
            if (fail) fail(reponse);
        }];
    }
    return [HHZHttpResult generateDefaultResult:httpTag RequestURL:request.url Task:getTask];
}

#pragma mark 处理网络请求结果的输出
+(HHZHttpResponse *)handleSuccessResponseObject:(id _Nullable)responseObject httpTag:(NSUInteger)httpTag request:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition task:(NSURLSessionDataTask * _Nonnull)task
{
    [self handlePrintJSON:condition.printJSONType paramaters:responseObject url:request.url tag:httpTag isRequest:NO task:task];
    
    HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
    reponse.object = responseObject;
    reponse.tag = httpTag;
    reponse.requestUrl = request.url;
    reponse.alertType = condition.alertType;
    reponse.taskState = task.state;
    return reponse;
}

+(HHZHttpResponse *)handleFailHttpTag:(NSUInteger)httpTag request:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition task:(NSURLSessionDataTask * _Nonnull)task error:(NSError * _Nonnull)error
{
    [self handleFailPrintJSON:condition.printJSONType url:request.url tag:httpTag error:error];
    
    HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
    reponse.errorInfo = error;
    reponse.tag = httpTag;
    reponse.requestUrl = request.url;
    reponse.alertType = condition.alertType;
    reponse.taskState = task.state;
    return reponse;
}

+(HHZHttpResult *)uploadImageWithDataArray:(NSArray<NSData *> *)imageDataArray request:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition success:(HHZSuccessBlock)success fail:(HHZFailureBlock)fail beforeSend:(HHZBeforeSendRequest)beforeSend
{
    //如果图片和文件名字不一致，则不上传
    if (imageDataArray.count != request.uploadFieldIDNames.count) return [[HHZHttpResult alloc] init];
    
    //生成Tag唯一标识
    NSUInteger httpTag = [[HHZHttpTagBuilder shareManager] getSoleHttpTag];
    
    //添加附加请求参数
    [self addExtraParamatersWithCondition:request];
    
    //对参数加密
    [self encryptionRequest:request];
    
    //处理Condition情况
    [self handleHttpCondition:condition];
    
    //打印参数信息
    [self handlePrintJSON:condition.printJSONType paramaters:request.paramaters url:request.url tag:httpTag isRequest:YES task:nil];
    
    //发送网络请求前的回调
    if (beforeSend) beforeSend(request,condition);
    
    NSURLSessionDataTask * uploadtask = [[HHZHttpManager shareManager] POST:request.url parameters:request.paramaters constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        for (int i = 0; i < imageDataArray.count; ++i)
        {
            //上传的参数(上传图片，以文件流的格式)
            [formData appendPartWithFileData:((NSData *)imageDataArray[i])
                                        name:request.uploadFieldIDNames[i]
                                    fileName:request.uploadImageNames[i]
                                    mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress *_Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) {
        HHZHttpResponse * reponse = [self handleSuccessResponseObject:responseObject httpTag:httpTag request:request appendCondition:condition task:task];
        reponse.uploadImageNames = request.uploadImageNames;
        reponse.uploadFieldIDNames = request.uploadFieldIDNames;
        if (success) success(reponse);
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        HHZHttpResponse * reponse = [self handleFailHttpTag:httpTag request:request appendCondition:condition task:task error:error];
        reponse.uploadImageNames = request.uploadImageNames;
        reponse.uploadFieldIDNames = request.uploadFieldIDNames;
        if (fail) fail(reponse);
    }];
    
    return [HHZHttpResult generateDefaultResult:httpTag RequestURL:request.url Task:uploadtask];
}



+(void)addExtraParamatersWithCondition:(HHZHttpRequest *)request
{
    [request.paramaters setObject:[HHZDeviceTool getCurrentVersion] forKey:@"kAppVersion"];
    [request.paramaters setObject:[HHZDeviceTool getPhoneType] forKey:@"kPhoneType"];
    [request.paramaters setObject:[HHZDeviceTool getDeviceSystemVersion] forKey:@"kPhoneVersion"];
    [request.paramaters setObject:@"iOS" forKey:@"kChannel"];
}



+(void)encryptionRequest:(HHZHttpRequest *)request
{
    switch (request.encryptionType) {
        case HHZEncryptionTypeMall:
        {
            request.paramaters = [HHZHttpEncryption encrytionParameterMethod1:request.paramaters privateKeyArray:[HHZHttpEncryption setMethod1ParametersArray] AESKey:[HHZHttpEncryption setMethod1AESKey]];
        }
            break;
        case HHZEncryptionTypeXiaoMei:
        {
            request.paramaters = [HHZHttpEncryption encrytionParameterMethod1:request.paramaters privateKeyArray:[HHZHttpEncryption setMethod1ParametersArray]];
        }
            break;
        default:
            break;
    }
}

+(void)handleHttpCondition:(HHZHttpRequestCondition *)condition
{
    //处理请求Content-Type
    [self handleSerializerType:condition];
    
    //处理请求方式和是否允许抓包
    [self handleHttpProtocalType:condition];
    
    //添加Headers
    
    
    //添加Cookies
    
}

+(void)handleSerializerType:(HHZHttpRequestCondition *)condition
{
    switch (condition.serializerType) {
        case HHZHttpSerializerType1: {
            [HHZHttpManager shareManager].requestSerializer = [AFJSONRequestSerializer serializer];
            [HHZHttpManager shareManager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType2: {
            [HHZHttpManager shareManager].requestSerializer = [AFJSONRequestSerializer serializer];
            [HHZHttpManager shareManager].responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType3: {
            [HHZHttpManager shareManager].requestSerializer = [AFHTTPRequestSerializer serializer];
            [HHZHttpManager shareManager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType4: {
            [HHZHttpManager shareManager].requestSerializer = [AFHTTPRequestSerializer serializer];
            [HHZHttpManager shareManager].responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        }
        default:
            break;
    }
}

+(void)handleHttpProtocalType:(HHZHttpRequestCondition *)condition
{
    switch (condition.httpType) {
        case HHZHttpProtocalTypeHTTP: {
            
            break;
        }
        case HHZHttpProtocalTypeHTTPS: {
            //如果已经是HTTP，则不设置
            if ([HHZHttpManager shareManager].securityPolicy.SSLPinningMode != AFSSLPinningModeNone)
            {
                [HHZHttpManager shareManager].securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
            }
            
            if (condition.allowSniffer)
            {
                // 2.设置证书模式
                NSData * cerData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hhzHttpCertificate" ofType:@"cer"]];
                [HHZHttpManager shareManager].securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[[NSSet alloc] initWithObjects:cerData, nil]];
            }
            else
            {
                [HHZHttpManager shareManager].securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
            }
            
            //是否信任非法证书
            [HHZHttpManager shareManager].securityPolicy.allowInvalidCertificates = condition.allowInvalidCer;
            
            //是否在证书域字段中验证域名
            [[HHZHttpManager shareManager].securityPolicy setValidatesDomainName:condition.allowValidateDomain];
            break;
        }
    }
}

+(void)handlePrintJSON:(HHZHttpPrintJSON)type paramaters:(id)paramaters url:(NSString *)url tag:(NSUInteger)httpTag isRequest:(BOOL)isRequest task:(NSURLSessionDataTask *)task
{
    NSString * str;
    if (isRequest) str = @"网络请求参数";
    else str = @"网络返回参数";
    
    BOOL printBasicInfo = NO;
    
    if ((DEBUG && type == HHZHttpPrintJSONDebug) || type == HHZHttpPrintJSONAlways) printBasicInfo = YES;
    if (DEBUG && [HHZHttpConfig shareManager].printHeaders)
    {
        NSLog(@"\n请求头信息:\n%@\n",task.currentRequest.allHTTPHeaderFields);
        if ([task.response isKindOfClass:[NSHTTPURLResponse class]])
        {
            NSLog(@"\n返回头信息:\n%@\n",((NSHTTPURLResponse *)task.response).allHeaderFields);
        }
    }
}

+(void)handleFailPrintJSON:(HHZHttpPrintJSON)type url:(NSString *)url tag:(NSUInteger)httpTag error:(NSError *)error
{
    NSString * str = @"网络返回参数(失败)";
    switch (type) {
        case HHZHttpPrintJSONDebug:
        {
#ifdef DEBUG
            NSLog(@"\n<%@(%@)/tag:%lu>\n%@\n",str,url,(long)httpTag,error);
#endif
        }
            break;
        case HHZHttpPrintJSONAlways:
        {
            NSLog(@"\n<%@(%@)/tag:%lu>\n%@\n",str,url,(long)httpTag,error);
        }
            break;
        default:
            break;
    }
}

+(void)addHttpHeaders:(HHZHttpRequestCondition *)condition
{
    if (!condition.headersDic && condition.headersDic.allKeys.count > 0)
    {
        for (NSString * key in condition.headersDic)
        {
            [[HHZHttpManager shareManager] setValue:condition.headersDic[key] forKey:key];
        }
    }
}

+(void)addHttpCookies:(HHZHttpRequestCondition *)condition
{
    if (!condition.cookiesDic && condition.cookiesDic.count > 0)
    {
        for (NSHTTPCookie * cookie in condition.cookiesDic)
        {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
}
@end
