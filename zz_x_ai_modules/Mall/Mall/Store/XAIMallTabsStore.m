//
//  XAIMallTabsStore.m
//  AFNetworking
//
//  Created by zz on 2026/1/5.
//

#import "XAIMallTabsStore.h"

@interface XAIMallTabsStore ()

@property(nonatomic,assign)NSInteger type;

@end

@implementation XAIMallTabsStore



+ (instancetype)shared{
    static XAIMallTabsStore *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


#pragma mark - Getters

- (NSInteger)typeIndex{
    return self.type;
}


#pragma mark - Actions

- (void)actionSwitchTypeIndex:(NSInteger)typeIndex{
    self.type = typeIndex;
}


@end
