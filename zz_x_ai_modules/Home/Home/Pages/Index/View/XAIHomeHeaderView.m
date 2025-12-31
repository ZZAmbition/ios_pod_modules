//
//  XAIHomeHeaderView.m
//  AFNetworking
//
//  Created by zz on 2025/12/18.
//

#import "XAIHomeHeaderView.h"
#import "XAIHomeHeaderTopView.h"
#import "XAIHomeHeaderBottomView.h"
#import <ZZKit/ZZKit.h>
#import "XAIHomeViewModel.h"

@interface XAIHomeHeaderView ()

@property(nonatomic,strong)XAIHomeHeaderTopView *topView;
@property(nonatomic,strong)XAIHomeHeaderBottomView *bottomView;

@end

@implementation XAIHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    self.backgroundColor = [UIColor redColor];
    [self addSubview:self.topView];
    [self addSubview:self.bottomView];
}




- (XAIHomeHeaderTopView *)topView{
    if (!_topView) {
        _topView = [[XAIHomeHeaderTopView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
        __weak typeof(self) weakSelf = self;
        _topView.switchTabBlock = ^(NSInteger type) {
            [weakSelf.xaiHomeViewModel getHomeTabsDataWithType:type];
        };
    }
    return _topView;
}

- (XAIHomeHeaderBottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[XAIHomeHeaderBottomView alloc] initWithFrame:CGRectMake(0, self.height/2, self.width, self.height/2)];
        __weak typeof(self) weakSelf = self;
        _bottomView.switchTabBlock = ^(NSInteger type) {
            [weakSelf.xaiHomeViewModel getHomeTabsDataWithType:type];
        };
    }
    return _bottomView;
}


@end
