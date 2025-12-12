//
//  XAINetWorkManager.h
//  Pods
//
//  Created by zz on 2025/10/21.
//

#import <Foundation/Foundation.h>
#import "XAINetWorkResponse.h"
#import "XAINetWorkProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^XAINetWorkSuccessHandler)(XAINetWorkResponse *  _Nullable obj);
typedef void(^XAINetWorkFailureHandler)(XAINetWorkResponse *  _Nullable obj);

@interface XAINetWorkManager : NSObject


+ (nullable id<XAINetWorkDataTaskProtocol>)sendRequest:(id<XAINetWorkRequestProtocol>)request
                                       success:(XAINetWorkSuccessHandler)successHandler
                                       failure:(XAINetWorkFailureHandler)failureHandler;

@end





NS_ASSUME_NONNULL_END
