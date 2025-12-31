//
//  UIDevice+Utils.m
//  AFNetworking
//
//  Created by imagine on 2023/4/18.
//

#import "UIDevice+Utils.h"

@implementation UIDevice (Utils)

+ (UIWindow *)window{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(window){
        return window;
    }
    UIWindow *rootWindow = [UIApplication sharedApplication].delegate.window;
    return rootWindow;
}


+ (BOOL)isIPhoneXseries{
    BOOL isX = NO;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        if (window) {
            if (@available(iOS 11.0,*)) {
                if (window.safeAreaInsets.left > 0 || window.safeAreaInsets.bottom > 0) {
                    isX = YES;;
                }
            }
        }
    }
    return isX;
}


+ (CGFloat)statusHeight{
    CGFloat height = [UIApplication sharedApplication].statusBarFrame.size.height;
    if(height > 0){
        return height;
    }
    if (@available(iOS 13.0, *)) {
        CGFloat heightIOS13 = [self window].windowScene.statusBarManager.statusBarFrame.size.height;
        if(height > 0){
            return heightIOS13;
        }
    }
    if (@available(iOS 11.0, *)) {
        if([self window].safeAreaInsets.bottom > 0){
            return [self window].safeAreaInsets.top;
        }
    }
    return 20;
}


+ (CGFloat)naviBarHeight{
    CGFloat height = [self statusHeight] + 44;
    return height;
}


+ (CGFloat)tabbarHeight{
    return [self statusHeight] > 20 ? 83 : 49;
}

+ (CGSize)mainScreenSize{
    return [UIScreen mainScreen].bounds.size;
}
@end
