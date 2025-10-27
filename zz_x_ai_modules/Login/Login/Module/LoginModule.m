//
//  LoginModule.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "LoginModule.h"
#import "XAILoginViewController.h"
#import "LoginModule+Route.h"


@implementation LoginModule

+ (void)load {
    BFRegister(XAILoginModuleFacadeProtocol);
}

+ (instancetype)sharedInstance {
    static LoginModule *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


// 模块启动入口
- (void)setup {
    NSLog(@"%@ - %@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    
    //路由注册
    [[self class] registLoginRoute];
}


- (UIViewController *)getLoginViewController { 
    return [[XAILoginViewController alloc] initWithViewModel];
}

@end
