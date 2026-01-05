//
//  XAIMallViewModel.h
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import <Foundation/Foundation.h>
#import "XAIMallViewListUIModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface XAIMallViewModel : NSObject

@property(nonatomic,strong)NSArray<XAIMallViewListUIModel *> *listArray;
@property (nonatomic, copy) dispatch_block_t mallViewListDataUpdateBlock;



@end

NS_ASSUME_NONNULL_END
