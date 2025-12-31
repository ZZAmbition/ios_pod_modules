//
//  XAIHomeViewModel.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "XAIHomeViewModel.h"
#import <DataService/DataService.h>
#import <DataService/HomeModel.h>




@interface XAIHomeViewModel()

@end

@implementation XAIHomeViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}


- (void)getHomeTabsDataWithType:(NSInteger)type{
    HomeTabRequest *req = [HomeTabRequest new];
    req.type = type;
    [XAINetWorkManager sendRequest:req success:^(XAINetWorkResponse *obj) {
        if ([obj.result isKindOfClass:[NSArray class]]) {
            NSArray *data = obj.result;
            NSMutableArray *mutiArray = [NSMutableArray array];
            for (HomeTabsModel *model in data) {
                XAIHomeViewListUIModel *uiModel = [XAIHomeViewListUIModel new];
                uiModel.name = model.name;
                [mutiArray addObject:uiModel];
            }
            if (mutiArray.count > 0 && self.homeViewListDataUpdateBlock) {
                self.listArray = [mutiArray copy];
                self.homeViewListDataUpdateBlock();
            }
        }
    } failure:^(XAINetWorkError *error) {
        
    }];
}


@end
