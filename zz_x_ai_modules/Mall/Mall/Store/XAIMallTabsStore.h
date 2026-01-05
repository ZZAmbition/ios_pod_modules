//
//  XAIMallTabsStore.h
//  AFNetworking
//
//  Created by zz on 2026/1/5.
//

#import <Foundation/Foundation.h>
#import "RFStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAIMallTabsStore : RFStore

+ (instancetype)shared;


- (NSInteger)typeIndex;

- (void)actionSwitchTypeIndex:(NSInteger)typeIndex;
@end

NS_ASSUME_NONNULL_END
