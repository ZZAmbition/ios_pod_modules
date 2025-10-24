//
//  CommunityModule.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "CommunityModule.h"
#import "XAICommunityViewController.h"

@implementation CommunityModule

+ (void)load {
    BFRegister(XAICommunityModuleFacadeProtocol)
}

+ (instancetype)sharedInstance {
    static CommunityModule *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


// 模块启动入口
- (void)setup {
    NSLog(@"%@ - %@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}


- (UIViewController *)getCommunityViewController { 
    return [[XAICommunityViewController alloc] initWithViewModel];
}

@end
