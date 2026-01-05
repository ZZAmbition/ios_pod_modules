//
//  XAIHomeViewController.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "XAIHomeViewController.h"
#import "XAIHomeHeaderView.h"
#import "XAIHomeSegmentView.h"
#import <ZZKit/ZZKit.h>

@interface XAIHomeViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)XAIHomeViewModel *xaiHomeViewModel;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)XAIHomeHeaderView *headerView;
@property(nonatomic,strong)XAIHomeSegmentView *segmentView;



@end

@implementation XAIHomeViewController

- (instancetype)initWithViewModel {
    if (self ==  [super init]) {
        self.xaiHomeViewModel = [XAIHomeViewModel new];
        __weak typeof(self) weakSelf = self;
        self.xaiHomeViewModel.homeViewListDataUpdateBlock = ^{
            [weakSelf.tableView reloadData];
        };
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
    [self.xaiHomeViewModel getHomeTabsDataWithType:1];
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
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0;
        }
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"XAIHomeViewController_Cell"];
    }
    return _tableView;
}


- (XAIHomeHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[XAIHomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice mainScreenSize].width, 275)];
        _headerView.xaiHomeViewModel = self.xaiHomeViewModel;
    }
    return _headerView;
}

- (XAIHomeSegmentView *)segmentView{
    if (!_segmentView) {
        _segmentView = [[XAIHomeSegmentView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice mainScreenSize].width, 60)];
        __weak typeof(self) weakSelf = self;
        _segmentView.switchTabBlock = ^(NSInteger type) {
            [weakSelf.xaiHomeViewModel getHomeTabsDataWithType:type];
        };
    }
    return _segmentView;
}




#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.xaiHomeViewModel.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XAIHomeViewController_Cell" forIndexPath:indexPath];
    XAIHomeViewListUIModel *model = self.xaiHomeViewModel.listArray[indexPath.row];
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
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}



@end
