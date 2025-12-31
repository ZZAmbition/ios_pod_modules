//
//  UserService.h
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import <Foundation/Foundation.h>
#import "XAINetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoRequest : XAINetWorkRequest

@property(nonatomic, strong)NSString *uid;

@end



@interface UserGoodsAddressListRequest : XAINetWorkRequest


@end

NS_ASSUME_NONNULL_END
