//
//  MallModule.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "MallModule.h"
#import "XAIMallViewController.h"
@implementation MallModule

+ (void)load {
    BFRegister(XAIMallModuleFacadeProtocol)
}

+ (instancetype)sharedInstance {
    static MallModule *instance = nil;
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


- (UIViewController *)getMallViewController { 
    return [[XAIMallViewController alloc] initWithViewModel];
}

@end
