//
//  XAIUserViewController.h
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import <UIKit/UIKit.h>
#import "XAIUserViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAIUserViewController : UIViewController

- (instancetype)initWithViewModel;
- (instancetype)initWithViewModel:(XAIUserViewModel *)viewModel;
@end

NS_ASSUME_NONNULL_END
