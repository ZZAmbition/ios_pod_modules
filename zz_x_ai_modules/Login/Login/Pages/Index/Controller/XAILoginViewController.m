//
//  XAILoginViewController.m
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import "XAILoginViewController.h"
#import <ZZKit/ZZKit.h>

@interface XAILoginViewController ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) XAILoginViewModel *xaiLoginViewModel;

@end

@implementation XAILoginViewController

- (instancetype)initWithViewModel {
    if (self ==  [super init]) {
        self.xaiLoginViewModel = [XAILoginViewModel new];
    }
    return self;
}


- (instancetype)initWithViewModel:(XAILoginViewModel *)viewModel {
    if (self == [super init]) {
        self.xaiLoginViewModel = viewModel;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
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
        _titleLabel.text = @"登录";
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}


@end
