//
//  XAIMallSegmentView.h
//  AFNetworking
//
//  Created by zz on 2026/1/4.
//

#import <UIKit/UIKit.h>
typedef void (^XAIMallSegmentViewSwitchTabBlock)(NSInteger type);
NS_ASSUME_NONNULL_BEGIN

@interface XAIMallSegmentView : UIView


@property(nonatomic, copy)XAIMallSegmentViewSwitchTabBlock switchTabBlock;

- (void)updateCurrentIndex:(NSInteger)index;

@end



@interface XAIMallSegmentViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@end
NS_ASSUME_NONNULL_END
