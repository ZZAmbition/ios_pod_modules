//
//  LoginModule.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "LoginModule.h"

@implementation LoginModule

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
    
}


@end
