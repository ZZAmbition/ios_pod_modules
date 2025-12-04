//
//  XAIUserViewController.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "XAIUserViewController.h"
#import <XAIMediator/XAIMediator.h>
#import <Bifrost/BifrostHeader.h>
#import <ZZKit/ZZKit.h>

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




- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setupViewLayout];
}

- (void)setupView {
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.loginBtn];
}


- (void)setupViewLayout {
    self.titleLabel.centerX = self.view.width/2;
    self.titleLabel.centerY = self.view.height/2;
    
    
    self.loginBtn.width = 100;
    self.loginBtn.centerX = self.view.width/2;
    self.loginBtn.top = 50;
    
}

- (void)clickedLoginBtn:(UIButton *)sender {
    [Bifrost openRouteWithURL:[RouteManager routeLogin] parameters:@{@"userid": @22}];
}

- (UILabel *)titleLabel {
    if (!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.text = @"我的";
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        _loginBtn.backgroundColor = [UIColor redColor];
        _loginBtn.tintColor = [UIColor yellowColor];
        [_loginBtn sizeToFit];
        [_loginBtn addTarget:self action:@selector(clickedLoginBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginBtn;
}

@end
