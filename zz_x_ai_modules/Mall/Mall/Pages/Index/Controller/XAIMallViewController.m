//
//  XAIMallViewController.m
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import "XAIMallViewController.h"
#import <ZZKit/ZZKit.h>

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
        _titleLabel.text = @"商城";
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

@end
