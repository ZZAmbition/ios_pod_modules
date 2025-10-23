//
//  XAITableViewController.m
//  ZZXAIApp
//
//  Created by zz on 2025/10/21.
//

#import "XAITableBarController.h"
#import "XAINavigationController.h"
#import <XAIMediator/XAIMediator.h>
#import <Bifrost/BifrostHeader.h>

@interface XAITableBarController ()

@property (nonatomic,strong) XAINavigationController *homeViewController;
@property (nonatomic,strong) XAINavigationController *mallViewController;
@property (nonatomic,strong) XAINavigationController *communityViewController;
@property (nonatomic,strong) XAINavigationController *userViewController;

@end

@implementation XAITableBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
}


- (XAINavigationController *)homeViewController {
    if (!_homeViewController){
        id<XAIHomeModuleFacadeProtocol> homeModule = BFModule(XAIHomeModuleFacadeProtocol);
        UIViewController *vc = homeModule.getHomeViewController;
        _homeViewController = [[XAINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"首页";
        [_homeViewController.tabBarItem setTitle:@"首页"];
    }
    return _homeViewController;
}


- (XAINavigationController *)mallViewController {
    if (!_mallViewController) {
        id<XAIMallModuleFacadeProtocol> mallModule = BFModule(XAIMallModuleFacadeProtocol);
        UIViewController *vc = mallModule.getMallViewController;
        _mallViewController = [[XAINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"商城";
        [_homeViewController.tabBarItem setTitle:@"商城"];
    }
    return _mallViewController;
}

- (XAINavigationController *)communityViewController {
    if (!_communityViewController) {
        id<XAICommunityModuleFacadeProtocol> mallModule = BFModule(XAICommunityModuleFacadeProtocol);
        UIViewController *vc = mallModule.getCommunityViewController;
        _communityViewController = [[XAINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"社区";
        [_homeViewController.tabBarItem setTitle:@"社区"];
    }
    return _communityViewController;
}


- (XAINavigationController *)userViewController {
    if (!_userViewController) {
        id<XAIUserModuleFacadeProtocol> mallModule = BFModule(XAIUserModuleFacadeProtocol);
        UIViewController *vc = mallModule.getUserViewController;
        _userViewController = [[XAINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"我的";
        [_homeViewController.tabBarItem setTitle:@"我的"];
    }
    return _userViewController;
}

@end
