//
//  XAIHomeViewModel.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "XAIHomeViewModel.h"


@interface XAIHomeViewModel()

@end

@implementation XAIHomeViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}


- (void)setupData {
    
    NSMutableArray *list = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        [list addObject:[NSString stringWithFormat:@"数据项 %d", i + 1]];
    }
    self.dataSource = [list copy];
}

@end
