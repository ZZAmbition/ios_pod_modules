//
//  XAIHomeSegmentView.h
//  Home
//
//  Created by zz on 2025/12/18.
//

#import <UIKit/UIKit.h>


typedef void (^XAIHomeSegmentViewSwitchTabBlock)(NSInteger type);
NS_ASSUME_NONNULL_BEGIN

@interface XAIHomeSegmentView : UIView

@property(nonatomic, copy)XAIHomeSegmentViewSwitchTabBlock switchTabBlock;

@end

NS_ASSUME_NONNULL_END
