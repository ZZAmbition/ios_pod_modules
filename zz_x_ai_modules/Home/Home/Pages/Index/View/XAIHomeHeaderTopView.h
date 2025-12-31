//
//  XAIHomeHeaderTopView.h
//  Home
//
//  Created by zz on 2025/12/23.
//

#import <UIKit/UIKit.h>

typedef void (^XAIHomeHeaderTopViewSwitchTabBlock)(NSInteger type);

NS_ASSUME_NONNULL_BEGIN

@interface XAIHomeHeaderTopView : UIView

@property(nonatomic, copy)XAIHomeHeaderTopViewSwitchTabBlock switchTabBlock;
@end

NS_ASSUME_NONNULL_END
