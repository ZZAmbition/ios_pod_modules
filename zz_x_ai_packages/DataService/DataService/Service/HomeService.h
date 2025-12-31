//
//  HomeService.h
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import <Foundation/Foundation.h>
#import "XAINetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeService : NSObject

@end



@interface HomeTabRequest : XAINetWorkRequest

@property(nonatomic, assign)NSInteger type;

@end

NS_ASSUME_NONNULL_END
