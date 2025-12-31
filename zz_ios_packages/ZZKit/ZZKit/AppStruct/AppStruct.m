//
//  AppStruct.m
//  AFNetworking
//
//  Created by imagine on 2023/4/18.
//

#import "AppStruct.h"

@implementation AppStruct
//+ (UIWindow *)window{
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    if(window){
//        return window;
//    }
//    UIWindow *rootWindow = [UIApplication sharedApplication].delegate.window;
//    return rootWindow;
//}

+ (UIWindow *)window {
    if (@available(iOS 13.0, *)) {
        for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                if ([scene isKindOfClass:[UIWindowScene class]]) {
                    UIWindowScene *windowScene = (UIWindowScene *)scene;
                    for (UIWindow *window in windowScene.windows) {
                        if (window.isKeyWindow) {
                            return window;
                        }
                    }
                }
            }
        }
        // 如果没找到 isKeyWindow 的，返回第一个 foregroundActive scene 的第一个 window（兜底）
        for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                if ([scene isKindOfClass:[UIWindowScene class]]) {
                    UIWindowScene *windowScene = (UIWindowScene *)scene;
                    if (windowScene.windows.count > 0) {
                        return windowScene.windows.firstObject;
                    }
                }
            }
        }
    }
    
    // iOS 12 及以下，或 fallback
    return [UIApplication sharedApplication].keyWindow;
}


+ (UITabBarController *)rootViewController{
    UITabBarController *vc = (UITabBarController *)[AppStruct window].rootViewController;
    return vc;
}

+ (UINavigationController *)selectedNavigationController{
    UITabBarController *vc = [AppStruct rootViewController];
    return vc.selectedViewController;
}

+ (UINavigationController *)currentNavigationController{
    UINavigationController *nv = [AppStruct currentViewController].navigationController;
    if (nv){
        return nv;
    }
    
    UIViewController *vc = [AppStruct rootViewController];
    UINavigationController *navi = [AppStruct selectedNavigationController];
    while (YES) {
        UIViewController *present = vc.presentedViewController;
        if (present){
            vc = present;
        }else if([vc isKindOfClass:[UINavigationController class]]){
            UIViewController *visibleVC = ((UINavigationController *)vc).visibleViewController;
            vc = visibleVC;
        }else if ([vc isKindOfClass:[UITabBarController class]]){
            UIViewController *selectedController = ((UITabBarController *)vc).selectedViewController;
            vc = selectedController;
        }else{
            break;;
        }
        
        if([vc isKindOfClass:[UINavigationController class]]){
            navi = (UINavigationController *)vc;
        }else if(vc.navigationController){
            navi = vc.navigationController;
        }else if([vc isKindOfClass:[UITabBarController class]]){
            UIViewController *selectedController = ((UITabBarController *)vc).selectedViewController;
            if([selectedController isKindOfClass:[UINavigationController class]]){
                navi = (UINavigationController *)selectedController;
            }
        }
    }
    return (UINavigationController *)vc;
}


+ (UIViewController *)currentViewController{
    UIViewController *vc = [AppStruct effectController];
    while (YES) {
        UIViewController *present = vc.presentedViewController;
        if (present){
            vc = present;
        }else if([vc isKindOfClass:[UINavigationController class]]){
            UIViewController *visibleVC = ((UINavigationController *)vc).visibleViewController;
            vc = visibleVC;
        }else if ([vc isKindOfClass:[UITabBarController class]]){
            UIViewController *selectedController = ((UITabBarController *)vc).selectedViewController;
            vc = selectedController;
        }else{
            break;;
        }
    }
    return vc;
}

+ (UIViewController *)currentPresentedViewController{
    UIViewController *vc = [AppStruct effectController];
    while (YES) {
        UIViewController *present = vc.presentedViewController;
        if (present){
            vc = present;
        }else{
            break;
        }
    }
    return vc;
}

+ (UIViewController *)effectController{
    UIViewController *key = [UIApplication sharedApplication].keyWindow.rootViewController;
    if(key){
        return key;
    }
    return [AppStruct rootViewController];
}



+ (void)switchTabbarIndex:(NSInteger)index{
    UIViewController *presentedViewController =[[self selectedNavigationController] presentedViewController];
    if(presentedViewController){
        [presentedViewController dismissViewControllerAnimated:NO completion:nil];
    }
    UINavigationController *preNavi = [self selectedNavigationController];
    [preNavi popToRootViewControllerAnimated:NO];
    [self rootViewController].selectedIndex = index;
    [[self rootViewController].delegate tabBarController:[self rootViewController] shouldSelectViewController:[self selectedNavigationController]];
}



@end
