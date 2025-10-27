//
//  AppStruct.h
//  AFNetworking
//
//  Created by imagine on 2023/4/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppStruct : NSObject

+ (UITabBarController *)rootViewController;
+ (UINavigationController *)selectedNavigationController;
+ (UINavigationController *)currentNavigationController;
+ (UIViewController *)currentViewController;
+ (UIViewController *)currentPresentedViewController;

//切换tabbar
+ (void)switchTabbarIndex:(NSInteger)index;

+ (UIWindow *)window;

@end

NS_ASSUME_NONNULL_END
