//
//  XAIMallHeaderView.m
//  Mall
//
//  Created by zz on 2026/1/4.
//

#import "XAIMallHeaderView.h"
#import "XAIMallHeaderTopView.h"
#import "XAIMallHeaderBottomView.h"
#import <ZZKit/ZZKit.h>


@interface XAIMallHeaderView ()

@property(nonatomic,strong)XAIMallHeaderTopView *topView;
@property(nonatomic,strong)XAIMallHeaderBottomView *bottomView;
@end

@implementation XAIMallHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.topView];
        [self addSubview:self.bottomView];
        
    }
    return self;
}



- (XAIMallHeaderTopView *)topView{
    if (!_topView) {
        _topView = [[XAIMallHeaderTopView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
    }
    return _topView;
}

- (XAIMallHeaderBottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[XAIMallHeaderBottomView alloc] initWithFrame:CGRectMake(0, self.height/2, self.width, self.height/2)];
    }
    return _bottomView;
}
@end
