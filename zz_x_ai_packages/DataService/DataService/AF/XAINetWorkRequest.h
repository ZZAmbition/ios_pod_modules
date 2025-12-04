//
//  XAINetWorkRequest.h
//  DataService
//
//  Created by zz on 2025/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HTTPMethod) {
    HTTPMethodGet = 1,
    HTTPMethodPost = 2,
//    HTTPMethodHead = 3,
//    HTTPMethodPut = 4,
//    HTTPMethodDelete = 5
};


@protocol XAINetWorkRequestProtocol <NSObject>

- (NSString *)baseURL;
- (HTTPMethod)httpMethod;
- (NSString *)path;
- (NSDictionary *)queryParameters;
- (NSDictionary *)parameters;
- (NSDictionary *)headers;

@end



@interface XAINetWorkRequest : NSObject <XAINetWorkRequestProtocol>

@end

NS_ASSUME_NONNULL_END
