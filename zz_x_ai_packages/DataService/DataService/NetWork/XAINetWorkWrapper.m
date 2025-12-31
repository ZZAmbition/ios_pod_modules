//
//  XAINetWorkWrapper.m
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import "XAINetWorkWrapper.h"

@interface XAINetWorkRequestWrapper ()

@property(nonatomic, weak)id<XAINetWorkRequestProtocol> request;

@end



@implementation XAINetWorkRequestWrapper



- (NSDictionary *)headers { 
    return self.request.headers;
}

- (NSString *)method { 
    NSString *method = @"";
    switch (self.request.method) {
        case HTTPMethodGet:
            method = @"GET";
            break;
        case HTTPMethodPost:
            method = @"POST";
            break;
        case HTTPMethodHead:
            method = @"HEAD";
            break;
        case HTTPMethodPut:
            method = @"PUT";
            break;
        case HTTPMethodDelete:
            method = @"DELETE";
            break;
        default:
            method = @"POST";
            break;
    };
    return method;
}

- (NSDictionary *)parameters { 
    return self.request.parameters;
}

- (NSString *)url { 
    NSString *urlStr = [self.request.baseURL stringByAppendingString:self.request.path];
    return urlStr;
}

- (void)wrap:(id<XAINetWorkRequestProtocol>)request { 
    self.request = request;
}




@end



@interface XAINetWorkAFDataTaskWrapper ()

@property(nonatomic, weak)NSURLSessionDataTask *task;

@end


@implementation XAINetWorkAFDataTaskWrapper


- (instancetype)initWithSessionDataTask:(NSURLSessionDataTask *)task {
    self = [super init];
    if (self) {
        _task = task;
    }
    return self;
}


- (void)cancel { 
    [_task cancel];
}

- (void)resume { 
    [_task resume];
}

- (void)suspend { 
    [_task suspend];
}

@end

