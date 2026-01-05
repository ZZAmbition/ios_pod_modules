//
//  XAIHomeViewModel.h
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import <Foundation/Foundation.h>
#import "XAIHomeViewListUIModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAIHomeViewModel : NSObject

@property(nonatomic,strong)NSArray<XAIHomeViewListUIModel *> *listArray;
@property (nonatomic, copy) dispatch_block_t homeViewListDataUpdateBlock;


- (void)getHomeTabsDataWithType:(NSInteger)type;


@end

NS_ASSUME_NONNULL_END
