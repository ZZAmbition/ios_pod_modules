//
//  XAIHomeViewController.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "XAIHomeViewController.h"
#import <Masonry/Masonry.h>

@interface XAIHomeViewController ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) XAIHomeViewModel *xaiHomeViewModel;

@end

@implementation XAIHomeViewController

- (instancetype)initWithViewModel {
    if (self ==  [super init]) {
        self.xaiHomeViewModel = [XAIHomeViewModel new];
    }
    return self;
}


- (instancetype)initWithViewModel:(XAIHomeViewModel *)viewModel {
    if (self == [super init]) {
        self.xaiHomeViewModel = viewModel;
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
        _titleLabel.text = @"首页";
    }
    return _titleLabel;
}




@end
