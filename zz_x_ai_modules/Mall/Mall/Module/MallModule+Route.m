//
//  MallModule+Route.m
//  Pods
//
//  Created by zz on 2026/1/5.
//

#import "MallModule+Route.h"
#import <XAIMediator/XAIMediator.h>
#import <ZZKit/ZZKit.h>
#import "XAIMallDetailViewController.h"

@implementation MallModule (Route)

+ (void)registMallRoute {
    
    [Bifrost registerRouteWithURL:[RouteManager routeMallDetail] handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
            XAIMallDetailViewController *detailVC = [XAIMallDetailViewController new];
            [AppStruct.currentNavigationController pushViewController:detailVC animated:YES];
        return YES;
    }];
}

@end
