//
//  XAIHomeHeaderBottomView.h
//  Home
//
//  Created by zz on 2025/12/23.
//

#import <UIKit/UIKit.h>


typedef void (^XAIHomeHeaderBottomViewSwitchTabBlock)(NSInteger type);
NS_ASSUME_NONNULL_BEGIN

@interface XAIHomeHeaderBottomView : UIView

@property(nonatomic, copy)XAIHomeHeaderBottomViewSwitchTabBlock switchTabBlock;
@end

NS_ASSUME_NONNULL_END
