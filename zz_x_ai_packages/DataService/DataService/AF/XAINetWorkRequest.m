//
//  XAINetWorkRequest.m
//  DataService
//
//  Created by zz on 2025/12/4.
//

#import "XAINetWorkRequest.h"

@implementation XAINetWorkRequest

- (instancetype)init{
    if(self = [super init]){
        
    }
    return self;
}

- (NSString *)baseURL{
    return @"https://ad.td-robot.com";
}

- (HTTPMethod)httpMethod{
    return HTTPMethodPost;
}

- (NSDictionary *)headers{
    //待实现
    return [NSDictionary dictionary];
}

- (NSDictionary *)queryParameters{
    return [NSDictionary dictionary];
}

- (nonnull NSDictionary *)parameters { 
    return [NSDictionary dictionary];
}


- (nonnull NSString *)path { 
    [NSException raise:NSInvalidArgumentException
                   format:@"%@ 必须在子类中重写方法: %s",
                           NSStringFromClass([self class]),
                           __func__];
    return nil;
}


@end
