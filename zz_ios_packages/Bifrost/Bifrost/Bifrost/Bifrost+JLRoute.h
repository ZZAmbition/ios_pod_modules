//
//  Bifrost+JLRoute.h
//  Bifrost
//
//  Created by imagine on 2023/4/24.
//

#import "Bifrost.h"

NS_ASSUME_NONNULL_BEGIN

@interface Bifrost (JLRoute)


+ (void)setupJLRoute;

+ (void)registerRouteWithURL:(NSString *)url handler:(BOOL (^)(NSDictionary<NSString *, id> *parameters))handlerBlock;

// 打开对应注册的路由
+ (void)openRouteWithURL:(NSString *)url parameters:(nullable NSDictionary<NSString *, id> *)parameters;

@end

NS_ASSUME_NONNULL_END
