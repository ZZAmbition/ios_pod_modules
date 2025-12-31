//
//  UserStateStore.m
//  TDNetWork
//
//  Created by imagine on 2023/5/6.
//

#import "UserStateStore.h"


@interface UserStateStore ()

@property(nonatomic,strong)UserInfoModel *userInfoModel;


@end

@implementation UserStateStore


+ (instancetype)shared{
    static UserStateStore *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


#pragma mark - Getters

- (UserInfoModel *)userInfoModel{
    return _userInfoModel;
}


#pragma mark - Actions




@end
