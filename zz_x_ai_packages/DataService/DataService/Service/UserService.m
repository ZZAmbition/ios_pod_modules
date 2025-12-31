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





@implementation UserGoodsAddressListRequest


- (NSString *)path{
    return @"/goods_address_list";
}


- (Class)resultClass{
    return [UserGoodsAddressModel class];
}


- (NSString *)resultKey{
    return @"address";
}

@end
