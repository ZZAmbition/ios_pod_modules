//
//  UserService.m
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import "UserService.h"
#import "UserModel.h"

@implementation UserInfoRequest

- (NSString *)path{
    return @"/getUserInfo";
}

- (NSDictionary *)parameters{
    return @{
        @"uid":self.uid
    };
}

- (Class)resultClass{
    return [UserInfoModel class];
}


@end





@implementation UserOrderRequest


- (NSString *)path{
    return @"/getUserOrder";
}

- (NSDictionary *)parameters{
    return @{
        @"type":[NSNumber numberWithLong:self.orderType]
    };
}

@end
