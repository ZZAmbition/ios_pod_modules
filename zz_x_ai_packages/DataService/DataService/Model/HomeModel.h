//
//  HomeModel.h
//  DataService
//
//  Created by zz on 2025/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeModel : NSObject

@end


@interface HomeTabsModel : NSObject

@property(nonatomic, assign)NSInteger tid;
@property(nonatomic, strong)NSString *name;

@end

NS_ASSUME_NONNULL_END
