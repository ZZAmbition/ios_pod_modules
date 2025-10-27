//
//  XAINavigationController.m
//  ZZXAIApp
//
//  Created by zz on 2025/10/23.
//

#import "XAINavigationController.h"

@interface XAINavigationController ()

@end

@implementation XAINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
