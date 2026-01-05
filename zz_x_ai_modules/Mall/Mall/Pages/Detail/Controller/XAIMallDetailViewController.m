//
//  XAIMallDetailViewController.m
//  AFNetworking
//
//  Created by zz on 2026/1/5.
//

#import "XAIMallDetailViewController.h"
#import "XAIMallSegmentView.h"
#import "XAIMallTabsStore.h"
#import <ZZKit/ZZKit.h>


@interface XAIMallDetailViewController ()
@property(nonatomic,strong)XAIMallSegmentView *segmentView;
@end

@implementation XAIMallDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.segmentView];
    [self.segmentView updateCurrentIndex:[[XAIMallTabsStore shared] typeIndex]];
}

- (XAIMallSegmentView *)segmentView{
    if (!_segmentView) {
        _segmentView = [[XAIMallSegmentView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice mainScreenSize].width, 60)];
        __weak typeof(self) weakSelf = self;
        _segmentView.switchTabBlock = ^(NSInteger type) {
            [[XAIMallTabsStore shared] actionSwitchTypeIndex:type];
            [weakSelf.segmentView updateCurrentIndex:type];
        };
    }
    return _segmentView;
}

@end
