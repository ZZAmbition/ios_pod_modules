//
//  XAIMallSegmentView.m
//  AFNetworking
//
//  Created by zz on 2026/1/4.
//

#import "XAIMallSegmentView.h"
#import <ZZKit/ZZKit.h>
@interface XAIMallSegmentView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,assign)NSInteger currIndex;

@end

@implementation XAIMallSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.currIndex = 0;
        self.dataSource = @[@"热门",@"历史",@"语文",@"数学",@"化学",@"物理"];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)updateCurrentIndex:(NSInteger)index{
    self.currIndex = index;
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
     
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(self.width/6.0, self.height - 20);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 创建 collectionView
       _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height -20) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        // 注册 cell
        [_collectionView registerClass:[XAIMallSegmentViewCell class] forCellWithReuseIdentifier:@"XAIMallSegmentView_Cell"];
    }
    return _collectionView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XAIMallSegmentViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XAIMallSegmentView_Cell" forIndexPath:indexPath];
    cell.titleLabel.backgroundColor = self.currIndex == indexPath.row ? [UIColor redColor] : [UIColor whiteColor];
    cell.titleLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.switchTabBlock) {
        self.switchTabBlock(indexPath.row);
    }
}

@end






@implementation XAIMallSegmentViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
    
    }
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}




@end
