//
//  XAICommunityViewController.h
//  Pods
//
//  Created by zz on 2025/10/21.
//

#import <UIKit/UIKit.h>
#import "XAICommunityViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAICommunityViewController : UIViewController

- (instancetype)initWithViewModel;
- (instancetype)initWithViewModel:(XAICommunityViewModel *)viewModel;
@end

NS_ASSUME_NONNULL_END
