//
//  XAICommunityViewController.m
//  Pods
//
//  Created by zz on 2025/10/21.
//

#import "XAICommunityViewController.h"
#import <ZZKit/ZZKit.h>

@interface XAICommunityViewController ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) XAICommunityViewModel *xaiCommunityViewModel;

@end

@implementation XAICommunityViewController

- (instancetype)initWithViewModel {
    if (self =  [super init]) {
        self.xaiCommunityViewModel = [XAICommunityViewModel new];
    }
    return self;
}


- (instancetype)initWithViewModel:(XAICommunityViewModel *)viewModel {
    if (self = [super init]) {
        self.xaiCommunityViewModel = viewModel;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setupViewLayout];
}

- (void)setupView {
    [self.view addSubview:self.titleLabel];
}


- (void)setupViewLayout {
    self.titleLabel.centerX = self.view.width/2;
    self.titleLabel.centerY = self.view.height/2;
}

- (UILabel *)titleLabel {
    if(!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.text = @"社区";
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

@end
