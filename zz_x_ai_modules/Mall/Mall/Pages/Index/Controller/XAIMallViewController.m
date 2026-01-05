//
//  XAIMallViewController.m
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import "XAIMallViewController.h"
#import <ZZKit/ZZKit.h>
#import "XAIMallHeaderView.h"
#import "XAIMallSegmentView.h"
#import "XAIMallTabsStore.h"
#import <XAIMediator/XAIMediator.h>
#import <Bifrost/BifrostHeader.h>

@interface XAIMallViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) XAIMallViewModel *xaiMallViewModel;


@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)XAIMallHeaderView *headerView;
@property(nonatomic,strong)XAIMallSegmentView *segmentView;

@property (nonatomic, strong) RFSubscription *subscription;

@end

@implementation XAIMallViewController



- (instancetype)initWithViewModel {
    if (self =  [super init]) {
        self.xaiMallViewModel = [XAIMallViewModel new];
        __weak typeof(self) weakSelf = self;
        self.xaiMallViewModel.mallViewListDataUpdateBlock = ^{
            [weakSelf.tableView reloadData];
        };
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
    __weak typeof(self) weakSelf = self;
    [[XAIMallTabsStore shared] actionSwitchTypeIndex:0];
    self.subscription = [[XAIMallTabsStore shared] subscribe:^(RFAction *action) {
         if (action.selector == @selector(actionSwitchTypeIndex:)) {
             NSLog(@"%@",action.arguments);
             NSLog(@"%ld",(long)[[XAIMallTabsStore shared] typeIndex]);
             [weakSelf.segmentView updateCurrentIndex:[[XAIMallTabsStore shared] typeIndex]];
         }
     }];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self setupViewLayout];
}


- (void)setupView {
    // 添加 tableView 到视图
    [self.view addSubview:self.tableView];
    
}


- (void)setupViewLayout {
    self.tableView.frame = self.view.bounds;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0;
        }
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"XAIMallViewController_Cell"];
    }
    return _tableView;
}


- (XAIMallHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[XAIMallHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice mainScreenSize].width, 180)];
        
    }
    return _headerView;
}

- (XAIMallSegmentView *)segmentView{
    if (!_segmentView) {
        _segmentView = [[XAIMallSegmentView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice mainScreenSize].width, 60)];
        __weak typeof(self) weakSelf = self;
        _segmentView.switchTabBlock = ^(NSInteger type) {
            [[XAIMallTabsStore shared] actionSwitchTypeIndex:type];
        };
    }
    return _segmentView;
}




#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.xaiMallViewModel.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XAIMallViewController_Cell" forIndexPath:indexPath];
    XAIMallViewListUIModel *model = self.xaiMallViewModel.listArray[indexPath.row];
    NSString *name = model.name;
    cell.textLabel.text = name;
    cell.detailTextLabel.text = name;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.segmentView;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [Bifrost openRouteWithURL:[RouteManager routeMallDetail] parameters:@{@"index": @(indexPath.row)}];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


@end
