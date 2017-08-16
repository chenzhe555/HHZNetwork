//
//  HHZHttpClient.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpClient.h"

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
    [self handlePrintJSON:condition.printJSONType paramaters:request.paramaters url:request.url tag:httpTag isRequest:YES];
    
    //发送网络请求前的回调
    if (beforeSend) beforeSend(request,condition);
    
    NSURLSessionDataTask * getTask = nil;
    if ([request.requestMethod isEqualToString:@"POST"]) {
        getTask = [[HHZHttpManager shareManager] POST:request.url parameters:request.paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self handlePrintJSON:condition.printJSONType paramaters:responseObject url:request.url tag:httpTag isRequest:NO];
            
            HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
            reponse.object = responseObject;
            reponse.tag = httpTag;
            reponse.requestUrl = request.url;
            reponse.alertType = condition.alertType;
            
            if (success) success(reponse);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
            reponse.errorInfo = error;
            reponse.tag = httpTag;
            reponse.requestUrl = request.url;
            reponse.alertType = condition.alertType;
            
            if (fail) fail(reponse);
        }];
    }
    else
    {
        getTask = [[HHZHttpManager shareManager] POST:request.url parameters:request.paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
            reponse.object = responseObject;
            reponse.tag = httpTag;
            reponse.requestUrl = request.url;
            reponse.alertType = condition.alertType;
            
            if (success) success(reponse);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
            reponse.errorInfo = error;
            reponse.tag = httpTag;
            reponse.requestUrl = request.url;
            reponse.alertType = condition.alertType;
            
            if (fail) fail(reponse);
        }];
    }
    return [HHZHttpResult generateDefaultResult:httpTag RequestURL:request.url Task:getTask];
}


+(HHZHttpResult *)uploadImageWithData:(NSData *)imageData request:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition success:(HHZSuccessBlock)success fail:(HHZFailureBlock)fail beforeSend:(HHZBeforeSendRequest)beforeSend
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
    [self handlePrintJSON:condition.printJSONType paramaters:request.paramaters url:request.url tag:httpTag isRequest:YES];
    
    //发送网络请求前的回调
    if (beforeSend) beforeSend(request,condition);
    
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    //接收类型不一致请替换一致text/html或别的
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
//                                                         @"text/html",
//                                                         @"image/jpeg",
//                                                         @"image/png",
//                                                         @"application/octet-stream",
//                                                         @"text/json",
//                                                         nil];
//    NSString * url1 = @"http://192.168.2.48/rhcrm/index.php/home/appios/upload_photo";
//    NSString * url2 = @"https://wx.kj521.com/rhcrm/index.php/home/appios/upload_photo";
    
    
    
    NSURLSessionDataTask * uploadtask = [[HHZHttpManager shareManager] POST:request.url parameters:request.paramaters constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:(request.uploadImageName.length == 0 ? @"missing.jpg" : request.uploadImageName)
                                mimeType:@"image/jpeg"];
    } progress:^(NSProgress *_Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) {
        HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
        reponse.object = responseObject;
        reponse.tag = httpTag;
        reponse.requestUrl = request.url;
        reponse.alertType = condition.alertType;
        reponse.uploadImageName = request.uploadImageName;
        
        if (success) success(reponse);
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
        reponse.errorInfo = error;
        reponse.tag = httpTag;
        reponse.requestUrl = request.url;
        reponse.alertType = condition.alertType;
        reponse.uploadImageName = request.uploadImageName;
        
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
            [AFHTTPSessionManager manager].requestSerializer = [AFJSONRequestSerializer serializer];
            [AFHTTPSessionManager manager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType2: {
            [AFHTTPSessionManager manager].requestSerializer = [AFJSONRequestSerializer serializer];
            [AFHTTPSessionManager manager].responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType3: {
            [AFHTTPSessionManager manager].requestSerializer = [AFHTTPRequestSerializer serializer];
            [AFHTTPSessionManager manager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType4: {
            [AFHTTPSessionManager manager].requestSerializer = [AFHTTPRequestSerializer serializer];
            [AFHTTPSessionManager manager].responseSerializer = [AFHTTPResponseSerializer serializer];
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

+(void)handlePrintJSON:(HHZHttpPrintJSON)type paramaters:(id)paramaters url:(NSString *)url tag:(NSUInteger)httpTag isRequest:(BOOL)isRequest
{
    NSString * str = nil;
    if (isRequest) str = @"网络请求参数";
    else str = @"网络返回参数";
    
    switch (type) {
        case HHZHttpPrintJSONDebug:
        {
#ifdef DEBUG
            NSLog(@"<%@(%@)/tag:%lu>\n%@\n",str,url,(long)httpTag,[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:paramaters options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding]);
#endif
        }
            break;
        case HHZHttpPrintJSONAlways:
        {
            NSLog(@"<%@(%@)/tag:%lu>\n%@\n",str,url,(long)httpTag,[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:paramaters options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding]);
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
