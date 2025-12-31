//
//  UserStateStore.h
//  TDNetWork
//
//  Created by imagine on 2023/5/6.
//

#import "RFStore.h"
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserStateStore : RFStore

+ (instancetype)shared;

//getters
- (UserInfoModel *)userInfoModel;

//actions
- (void)actionGetUserInfo:(UserInfoModel *)userInfoModel;

@end

NS_ASSUME_NONNULL_END
