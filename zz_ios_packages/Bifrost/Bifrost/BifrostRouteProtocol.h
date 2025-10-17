//
//  BifrostRouteProtocol.h
//  Bifrost
//
//  Created by imagine on 2023/4/24.
//

#ifndef BifrostRouteProtocol_h
#define BifrostRouteProtocol_h


@protocol BifrostRouteProtocol <NSObject>

@required

// 将路由信息转发到对应的代理类处理
+ (BOOL)handleRouteParameters:(nullable NSDictionary<NSString *, id> *)parameters;

@optional
@end


#endif /* BifrostRouteProtocol_h */
