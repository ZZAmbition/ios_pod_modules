//
//  XAIUserViewController.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "XAIUserViewController.h"
#import <Masonry/Masonry.h>

@interface XAIUserViewController ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) XAIUserViewModel *xaiUserViewModel;

@end

@implementation XAIUserViewController

- (instancetype)initWithViewModel {
    if (self =  [super init]) {
        self.xaiUserViewModel = [XAIUserViewModel new];
    }
    return self;
}


- (instancetype)initWithViewModel:(XAIUserViewModel *)viewModel {
    if (self = [super init]) {
        self.xaiUserViewModel = viewModel;
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
