//
//  UserService.m
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import "UserService.h"

@implementation UserInfoRequest

- (NSString *)path{
    return @"/getUserInfo";
}

- (NSDictionary *)parameters{
    return @{
        @"uid":self.uid
    };
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
