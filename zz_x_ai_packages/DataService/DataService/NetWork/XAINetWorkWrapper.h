//
//  XAINetWorkWrapper.h
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "XAINetWorkProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAINetWorkRequestWrapper : NSObject<XAINetWorkWrapRequestProtocol>


@end




@interface XAINetWorkAFDataTaskWrapper : NSObject<XAINetWorkDataTaskProtocol>

- (instancetype)initWithSessionDataTask:(NSURLSessionDataTask *)task;

@end

NS_ASSUME_NONNULL_END
