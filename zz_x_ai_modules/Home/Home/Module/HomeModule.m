//
//  HomeModule.m
//  AFNetworking
//
//  Created by zz on 2025/10/22.
//

#import "HomeModule.h"
#import "XAIHomeViewController.h"

@implementation HomeModule


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
    
}


- (UIViewController *)getHomeViewController { 
    return [[XAIHomeViewController alloc] initWithViewModel];
}

@end
