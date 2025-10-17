//
//  Bifrost+JLRoute.m
//  Bifrost
//
//  Created by imagine on 2023/4/24.
//

#import "Bifrost+JLRoute.h"
#import "JLRoutes.h"
@implementation Bifrost (JLRoute)

+ (void)routeConfig{
    [JLRoutes setVerboseLoggingEnabled:YES];
}

+ (void)registerRouteWithURL:(NSString *)url handler:(BOOL (^)(NSDictionary<NSString *, id> *parameters))handlerBlock{
    NSString *str = url;
    if ([url containsString:@"://"]){
        str = [url componentsSeparatedByString:@"://"].lastObject;
    }
    [[JLRoutes globalRoutes] addRoute:str handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return handlerBlock(parameters);
    }];
}

+ (void)registerRoute:(Class<BifrostRouteProtocol>)route with:(NSString *)url{
    NSString *str = url;
    if ([url containsString:@"://"]){
        str = [url componentsSeparatedByString:@"://"].lastObject;
    }
    [[JLRoutes globalRoutes] addRoute:str handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [route handleRouteParameters:parameters];
    }];
}

+ (void)openRouteWithURL:(NSString *)url parameters:(nullable NSDictionary<NSString *, id> *)parameters{
    [[JLRoutes globalRoutes] routeURL:[NSURL URLWithString:url] withParameters:parameters];
}

@end
