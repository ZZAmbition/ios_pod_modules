//
//  UserModel.m
//  DataService
//
//  Created by zz on 2025/12/15.
//

#import "UserModel.h"


@implementation UserGoodsAddressModel



@end



@implementation UserInfoModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{
        @"address" : [UserGoodsAddressModel class],
    };
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"uid" : @"id",
    };
}

@end
