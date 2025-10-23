//
//  XAIHomeViewController.h
//  Pods
//
//  Created by zz on 2025/10/22.
//

#import <UIKit/UIKit.h>
#import "XAIHomeViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAIHomeViewController : UIViewController

- (instancetype)initWithViewModel;
- (instancetype)initWithViewModel:(XAIHomeViewModel *)viewModel;


@end

NS_ASSUME_NONNULL_END
