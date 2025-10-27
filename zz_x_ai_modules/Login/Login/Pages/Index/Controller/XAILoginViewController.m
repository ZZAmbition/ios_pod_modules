//
//  XAILoginViewController.m
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import "XAILoginViewController.h"
#import <Masonry/Masonry.h>

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
        _titleLabel.text = @"登录";
    }
    return _titleLabel;
}


@end
