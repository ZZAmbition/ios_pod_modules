//
//  XAIMallViewModel.m
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import "XAIMallViewModel.h"
#import <DataService/DataService.h>
#import <DataService/HomeModel.h>
#import "XAIMallTabsStore.h"

@interface XAIMallViewModel ()
@property (nonatomic, strong) RFSubscription *subscription;
@end

@implementation XAIMallViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    __weak typeof(self) weakSelf = self;
   self.subscription = [[XAIMallTabsStore shared] subscribe:^(RFAction *action) {
        if (action.selector == @selector(actionSwitchTypeIndex:)) {
            NSLog(@"%@",action.arguments);
            NSLog(@"%ld",(long)[[XAIMallTabsStore shared] typeIndex]);
            [weakSelf getHomeTabsDataWithType:[[XAIMallTabsStore shared] typeIndex] + 1];
        }
    }];
}


- (void)getHomeTabsDataWithType:(NSInteger)type{
    HomeTabRequest *req = [HomeTabRequest new];
    req.type = type;
    [XAINetWorkManager sendRequest:req success:^(XAINetWorkResponse *obj) {
        if ([obj.result isKindOfClass:[NSArray class]]) {
            NSArray *data = obj.result;
            NSMutableArray *mutiArray = [NSMutableArray array];
            for (HomeTabsModel *model in data) {
                XAIMallViewListUIModel *uiModel = [XAIMallViewListUIModel new];
                uiModel.name = model.name;
                [mutiArray addObject:uiModel];
            }
            if (mutiArray.count > 0 && self.mallViewListDataUpdateBlock) {
                self.listArray = [mutiArray copy];
                self.mallViewListDataUpdateBlock();
            }
        }
    } failure:^(XAINetWorkError *error) {
        
    }];
}



@end
