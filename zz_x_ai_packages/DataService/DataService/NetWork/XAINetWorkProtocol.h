//
//  XAINetWorkProtocol.h
//  Pods
//
//  Created by zz on 2025/12/12.
//
#import "XAINetWorkResponse.h"
#import "XAINetWorkError.h"

@protocol XAINetWorkWrapRequestProtocol;
@protocol XAINetWorkParserProtocol;

typedef void(^XAINetWorkSuccessHandler)(XAINetWorkResponse * obj);
typedef void(^XAINetWorkFailureHandler)(XAINetWorkError * error);

#ifndef XAINetWorkProtocol_h
#define XAINetWorkProtocol_h


#pragma mark -- http请求

typedef NS_ENUM(NSUInteger, HTTPMethod) {
    HTTPMethodGet = 1,
    HTTPMethodPost = 2,
    HTTPMethodHead = 3,
    HTTPMethodPut = 4,
    HTTPMethodDelete = 5
};


@protocol XAINetWorkRequestProtocol <NSObject>

- (NSString *)baseURL;
- (HTTPMethod)method;
- (NSString *)path;
- (NSDictionary *)parameters;
- (NSDictionary *)headers;
- (id<XAINetWorkWrapRequestProtocol>)wrapper;
- (id<XAINetWorkParserProtocol>)parser;


- (Class)resultClass;  //返回数据类型
- (NSString *)resultKey; // json key有返回值多解析一层

@end

#pragma mark -- http请求包装器

@protocol XAINetWorkWrapRequestProtocol <NSObject>

- (NSString *)url;
- (NSString *)method;
- (NSDictionary *)parameters;
- (NSDictionary *)headers;

- (void)wrap:(id<XAINetWorkRequestProtocol>)request;

@end


#pragma mark -- http请求响应数据解析器

@protocol XAINetWorkParserProtocol <NSObject>

- (void)parse:(id)response
  resultClass:(Class)resultClass
    resultKey:(NSString *)resultKey
      success:(XAINetWorkSuccessHandler)successHandler
      failure:(XAINetWorkFailureHandler)failureHandler;

@end


#pragma mark -- http任务

@protocol XAINetWorkDataTaskProtocol <NSObject>

- (void)cancel;
- (void)suspend;
- (void)resume;

@end


#endif /* XAINetWorkProtocol_h */
