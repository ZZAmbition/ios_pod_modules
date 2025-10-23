//
//  XAIMallViewController.m
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import "XAIMallViewController.h"
#import <Masonry/Masonry.h>

@interface XAIMallViewController ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) XAIMallViewModel *xaiMallViewModel;

@end

@implementation XAIMallViewController



- (instancetype)initWithViewModel {
    if (self =  [super init]) {
        self.xaiMallViewModel = [XAIMallViewModel new];
    }
    return self;
}


- (instancetype)initWithViewModel:(XAIMallViewModel *)viewModel {
    if (self = [super init]) {
        self.xaiMallViewModel = viewModel;
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
        _titleLabel.text = @"商城";
    }
    return _titleLabel;
}

@end
