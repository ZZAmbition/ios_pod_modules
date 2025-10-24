//
//  XAILoginViewController.h
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import <UIKit/UIKit.h>
#import "XAILoginViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAILoginViewController : UIViewController

- (instancetype)initWithViewModel;
- (instancetype)initWithViewModel:(XAILoginViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
