//
//  XAINetWorkManager.m
//  Pods
//
//  Created by zz on 2025/10/21.
//

#import "XAINetWorkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "XAINetWorkWrapper.h"
@implementation XAINetWorkManager

static AFHTTPSessionManager *manager;
+ (AFHTTPSessionManager *)sharedHTTPManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    return manager;
}


+ (nullable id<XAINetWorkDataTaskProtocol>)sendRequest:(nonnull id<XAINetWorkRequestProtocol>)request success:(nonnull XAINetWorkSuccessHandler)successHandler failure:(nonnull XAINetWorkFailureHandler)failureHandler {
    //请求包装
    id<XAINetWorkWrapRequestProtocol> wrapper = request.wrapper;
    [wrapper wrap:request];
    
    //响应解析
    id<XAINetWorkParserProtocol> parser = request.parser;
    
    AFHTTPSessionManager *httpManager = [self sharedHTTPManager];
    NSURLSessionDataTask *dataTask = [httpManager dataTaskWithHTTPMethod:wrapper.method URLString:wrapper.url parameters:wrapper.parameters headers:wrapper.headers uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@ --- %@",task.response,responseObject);
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        [parser parse:responseObject resultClass:request.resultClass resultKey:request.resultKey success:^(XAINetWorkResponse *obj) {
            obj.stateCode = response.statusCode;
            successHandler(obj);
        } failure:^(XAINetWorkError *error) {
            error.stateCode = response.statusCode;
            failureHandler(error);
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@ --- %@",task.response,error);
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        XAINetWorkError *err = [XAINetWorkError new];
        err.type = TDNetWorkErrorTypeServerError;
        err.stateCode = response.statusCode;
        err.error = error;
        failureHandler(err);
    }];
    
    XAINetWorkAFDataTaskWrapper *dataTaskWrapper = [[XAINetWorkAFDataTaskWrapper alloc] initWithSessionDataTask:dataTask];
    [dataTaskWrapper resume];
    return dataTaskWrapper;
}

@end





