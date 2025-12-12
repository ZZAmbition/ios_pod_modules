//
//  XAINetWorkRequest.m
//  DataService
//
//  Created by zz on 2025/12/4.
//

#import "XAINetWorkRequest.h"
#import "XAINetWorkWrapper.h"


@implementation XAINetWorkRequest

- (NSString *)baseURL{
    return @"http://127.0.0.1:4523/m1/7490051-7225482-default";
}

- (HTTPMethod)method{
    return HTTPMethodPost;
}

- (NSDictionary *)headers{
    return nil;
}

- (NSDictionary *)parameters {
    return nil;
}


- (nonnull NSString *)path { 
    [NSException raise:NSInvalidArgumentException
                   format:@"%@ 必须在子类中重写方法: %s",
                           NSStringFromClass([self class]),
                           __func__];
    return nil;
}

- (id<XAINetWorkWrapRequestProtocol>)wrapper { 
    return [XAINetWorkRequestWrapper new];
}


@end
