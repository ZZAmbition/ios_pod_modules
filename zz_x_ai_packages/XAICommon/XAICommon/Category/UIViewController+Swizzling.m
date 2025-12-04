//
//  UIViewController+Swizzling.m
//  TDUtils
//
//  Created by imagine on 2023/4/20.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>


@implementation UIViewController (Swizzling)


+ (void)load {
    Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method swizzling_viewDidLoad = class_getInstanceMethod(self, @selector(swizzling_viewDidLoad));
    method_exchangeImplementations(viewDidLoad, swizzling_viewDidLoad);
    
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method swizzling_viewWillAppear = class_getInstanceMethod(self, @selector(swizzling_viewWillAppear));
    method_exchangeImplementations(viewWillAppear, swizzling_viewWillAppear);
    
    Method viewWillDisappear = class_getInstanceMethod(self, @selector(viewWillDisappear:));
    Method swizzling_viewWillDisappear = class_getInstanceMethod(self, @selector(swizzling_viewWillDisappear));
    method_exchangeImplementations(viewWillDisappear, swizzling_viewWillDisappear);
    
    
    Method presentViewController = class_getInstanceMethod(self, @selector(presentViewController:animated:completion:));
    Method swizzling_presentViewController = class_getInstanceMethod(self, @selector(swizzling_presentViewController:animated:completion:));
    method_exchangeImplementations(presentViewController, swizzling_presentViewController);
}

// 先走这个方法，然后调用主类的viewDidLoad
- (void)swizzling_viewDidLoad{
    if ([self conformsToProtocol:@protocol(PageColorSwizzlingDelegate)]) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
   
    //背景view是否延伸到导航栏下面
//    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self swizzling_viewDidLoad];
}

- (void)swizzling_viewWillAppear{
    [self swizzling_viewWillAppear];
}

- (void)swizzling_viewWillDisappear{
    [self swizzling_viewWillDisappear];
}

- (void)swizzling_presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion {
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    [self swizzling_presentViewController:viewControllerToPresent animated:flag completion:completion];
}


@end

