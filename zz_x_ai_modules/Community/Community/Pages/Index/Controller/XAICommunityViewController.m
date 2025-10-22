//
//  XAICommunityViewController.m
//  Pods
//
//  Created by zz on 2025/10/21.
//

#import "XAICommunityViewController.h"
#import <Masonry/Masonry.h>

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

- (void)setupView {
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
    
}

- (UILabel *)titleLabel {
    if(!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.text = @"社区";
    }
    return _titleLabel;
}

@end
