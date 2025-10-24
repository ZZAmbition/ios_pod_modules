//
//  HomeModule.m
//  AFNetworking
//
//  Created by zz on 2025/10/22.
//

#import "HomeModule.h"
#import "XAIHomeViewController.h"

@implementation HomeModule

+ (void)load {
    BFRegister(XAIHomeModuleFacadeProtocol)
}


+ (instancetype)sharedInstance {
    static HomeModule *instance = nil;
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


- (UIViewController *)getHomeViewController { 
    return [[XAIHomeViewController alloc] initWithViewModel];
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@ - %@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return YES;
}
@end
