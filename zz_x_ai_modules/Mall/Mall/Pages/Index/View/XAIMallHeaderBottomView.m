//
//  XAIMallHeaderBottomView.m
//  Mall
//
//  Created by zz on 2026/1/4.
//

#import "XAIMallHeaderBottomView.h"
#import "XAIMallSegmentView.h"
#import "XAIMallTabsStore.h"


@interface XAIMallHeaderBottomView ()

@property(nonatomic,strong)XAIMallSegmentView *segmentView;
@property (nonatomic, strong) RFSubscription *subscription;
@end

@implementation XAIMallHeaderBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.segmentView];
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
            [weakSelf.segmentView updateCurrentIndex:[[XAIMallTabsStore shared] typeIndex]];
        }
    }];
}


- (XAIMallSegmentView *)segmentView{
    if (!_segmentView) {
        _segmentView = [[XAIMallSegmentView alloc] initWithFrame:self.bounds];
        __weak typeof(self) weakSelf = self;
        _segmentView.switchTabBlock = ^(NSInteger type) {
            [[XAIMallTabsStore shared] actionSwitchTypeIndex:type];
        };
    }
    return _segmentView;
}



@end
