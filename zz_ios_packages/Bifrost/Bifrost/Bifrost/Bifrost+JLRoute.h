//
//  Bifrost+JLRoute.h
//  Bifrost
//
//  Created by imagine on 2023/4/24.
//
/**
  整个路由的设计思路
  业务层 （主工程/home/knowledge/hardware/user）
  可以在业务层设置对应的 ModuleRoutes + block  来注册和回调，在每个模块的入口处调用注册方法
  当单个路由业务过于复杂时，可以考虑使用代理给对应的处理类来简化 ModuleRoutes
  所以考虑使用block注册方式为主，代理方式为辅
  ModuleRoutes  参考主工程  （AppRoutes）   knowledge（KnowledgeRoutes）注册分别在 Appdelegate 和 KnowledgeModule
 */

#import "Bifrost.h"
#import "BifrostRouteProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Bifrost (JLRoute)


+ (void)routeConfig;

+ (void)registerRouteWithURL:(NSString *)url handler:(BOOL (^)(NSDictionary<NSString *, id> *parameters))handlerBlock;

+ (void)registerRoute:(Class<BifrostRouteProtocol>)route with:(NSString *)url;

// 打开对应注册的路由
+ (void)openRouteWithURL:(NSString *)url parameters:(nullable NSDictionary<NSString *, id> *)parameters;

@end

NS_ASSUME_NONNULL_END
