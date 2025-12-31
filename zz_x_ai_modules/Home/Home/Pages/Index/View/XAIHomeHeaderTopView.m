//
//  XAIHomeHeaderTopView.m
//  Home
//
//  Created by zz on 2025/12/23.
//

#import "XAIHomeHeaderTopView.h"
#import <ZZKit/ZZKit.h>


@interface XAIHomeHeaderTopView ()

@property (nonatomic,strong) UIButton *hotBtn;
@property (nonatomic,strong) UIButton *historyBtn;

@end


@implementation XAIHomeHeaderTopView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.hotBtn];
    [self addSubview:self.historyBtn];
    
}


- (void)clickedHotBtnEvent:(UIButton *)sender {
    self.hotBtn.backgroundColor = [UIColor redColor];
    self.historyBtn.backgroundColor = [UIColor whiteColor];
    if (self.switchTabBlock) {
        self.switchTabBlock(1);
    }
}

- (void)clickedHistoryBtnEvent:(UIButton *)sender {
    self.hotBtn.backgroundColor = [UIColor whiteColor];
    self.historyBtn.backgroundColor = [UIColor redColor];
    if (self.switchTabBlock) {
        self.switchTabBlock(2);
    }
}



- (UIButton *)hotBtn {
    if (!_hotBtn) {
        _hotBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _hotBtn.frame = CGRectMake(0, 0, 100, 35);
        _hotBtn.right = self.width/2 - 10;
        _hotBtn.centerY = self.height/2;
        [_hotBtn setTitle:@"热门" forState:(UIControlStateNormal)];
        _hotBtn.backgroundColor = [UIColor redColor];
        _hotBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_hotBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_hotBtn addTarget:self action:@selector(clickedHotBtnEvent:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _hotBtn;
}


- (UIButton *)historyBtn {
    if (!_historyBtn) {
        _historyBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _historyBtn.frame = CGRectMake(0, 0, 100, 35);
        _historyBtn.left = self.width/2 + 10;
        _historyBtn.centerY = self.height/2;
        [_historyBtn setTitle:@"历史" forState:(UIControlStateNormal)];
        _historyBtn.backgroundColor = [UIColor whiteColor];
        _historyBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_historyBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_historyBtn addTarget:self action:@selector(clickedHistoryBtnEvent:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _historyBtn;
}


@end
