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

// block方式回调
// 适用于非业务层的模块注册， 比如切换tabbar/打开webviewcontroller
// tabbar切换不属于某个类的职责，感觉更像是整个App的职责，当职责划分不清晰的时候可以统一放在AppRoutes中处理
// webviewcontroller作为工具层被业务层（home/knowledge/hardware/user）调用，所以打开webviewcontroller也像是整个App的职责
// 为什么不把对应的路由事件代理到 webviewcontroller 处理 ？
// 因为除业务层外，其他库没有依赖TDMediator，也就没有办法实现BifrostRouteProtocol协议
// 为什么不让 webviewcontroller 依赖 TDMediator？
// 如果 webviewcontroller 依赖 TDMediator，那么就具备了和业务层直接通信的能力，更像是在同一层
// 它们之间既有横向依赖，又有垂直依赖，这样显然不符合架构设计的理念，耦合度过高，导致难以抽离
// 如果业务层和webviewcontroller涉及到js交互时，这时可以通过继承或者依赖注入的方式在  业务层/主工程 新建 类/模块 来和业务层保持同级
+ (void)registerRouteWithURL:(NSString *)url handler:(BOOL (^)(NSDictionary<NSString *, id> *parameters))handlerBlock;

// 代理方式回调
// 适用于业务层面对应的模块注册
// 对应的类处理对应的路由事件，职责划分清晰
+ (void)registerRoute:(Class<BifrostRouteProtocol>)route with:(NSString *)url;

// 打开对应注册的路由
+ (void)openRouteWithURL:(NSString *)url parameters:(nullable NSDictionary<NSString *, id> *)parameters;


@end

NS_ASSUME_NONNULL_END
