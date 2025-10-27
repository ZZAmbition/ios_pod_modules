//
//  XAIUserViewController.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "XAIUserViewController.h"
#import <Masonry/Masonry.h>
#import <XAIMediator/XAIMediator.h>
#import <Bifrost/BifrostHeader.h>


@interface XAIUserViewController ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) XAIUserViewModel *xaiUserViewModel;
@property (nonatomic,strong) UIButton *loginBtn;

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
    
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
    }];
    
}

- (void)clickedLoginBtn:(UIButton *)sender {
    [Bifrost openRouteWithURL:[RouteManager routeLogin] parameters:@{@"userid": @22}];
}

- (UILabel *)titleLabel {
    if (!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.text = @"我的";
    }
    return _titleLabel;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        _loginBtn.backgroundColor = [UIColor redColor];
        _loginBtn.tintColor = [UIColor yellowColor];
        [_loginBtn addTarget:self action:@selector(clickedLoginBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginBtn;
}

@end
