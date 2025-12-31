//
//  UserModel.h
//  DataService
//
//  Created by zz on 2025/12/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface UserGoodsAddressModel : NSObject

@property(nonatomic, strong)NSString *province;
@property(nonatomic, strong)NSString *city;
@property(nonatomic, strong)NSString *district;
@property(nonatomic, strong)NSString *tel;
@property(nonatomic, strong)NSString *name;

@end


@interface UserInfoModel : NSObject

@property(nonatomic, assign)NSInteger uid;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *tel;


@end





NS_ASSUME_NONNULL_END
