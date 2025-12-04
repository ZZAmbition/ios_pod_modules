//
//  XAIHomeViewController.m
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import "XAIHomeViewController.h"


@interface XAIHomeViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) XAIHomeViewModel *xaiHomeViewModel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *tableHeadView;

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
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self setupViewLayout];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}


- (void)setupView {
    // 添加 tableView 到视图
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.tableHeadView;
    
}


- (void)setupViewLayout {
    self.tableView.frame = self.view.bounds;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(160, 0, 0, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"XAIHomeViewController_Cell"];
    }
    return _tableView;
}

- (UIView *)tableHeadView{
    if (!_tableHeadView) {
        _tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 275)];
        _tableHeadView.backgroundColor = [UIColor yellowColor];
    }
    return _tableHeadView;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.xaiHomeViewModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XAIHomeViewController_Cell" forIndexPath:indexPath];
    NSString *title = self.xaiHomeViewModel.dataSource[indexPath.row];
    cell.textLabel.text = title;
    cell.detailTextLabel.text = title;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




@end
