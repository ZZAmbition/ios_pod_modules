//
//  LoginModule+Route.m
//  Login
//
//  Created by zz on 2025/10/27.
//

#import "LoginModule+Route.h"
#import <Bifrost/BifrostHeader.h>
#import <XAIMediator/XAIMediator.h>
#import <ZZKit/ZZKit.h>
#import "XAILoginViewController.h"


@implementation LoginModule (Route)

+ (void)registLoginRoute {
    
    [Bifrost registerRouteWithURL:[RouteManager routeLogin] handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        XAILoginViewController *loginVC = [[XAILoginViewController alloc] initWithViewModel];
        if ([parameters[@"userid"] isKindOfClass:[NSNumber class]]){
            [AppStruct.currentNavigationController pushViewController:loginVC animated:YES];
//            [AppStruct.currentPresentedViewController presentViewController:loginVC animated:YES completion:nil];
        }
        return YES;
    }];
}

@end
