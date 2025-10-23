//
//  UserModule.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "UserModule.h"
#import "XAIUserViewController.h"
@implementation UserModule



+ (instancetype)sharedInstance {
    static UserModule *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


// 模块启动入口
- (void)setup {
    
}


- (UIViewController *)getUserViewController {
    return [[XAIUserViewController alloc] initWithViewModel];
}


@end
