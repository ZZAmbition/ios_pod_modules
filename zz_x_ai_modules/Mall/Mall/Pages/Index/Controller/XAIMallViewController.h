//
//  XAIMallViewController.h
//  Mall
//
//  Created by zz on 2025/10/22.
//

#import <UIKit/UIKit.h>
#import "XAIMallViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAIMallViewController : UIViewController


- (instancetype)initWithViewModel;
- (instancetype)initWithViewModel:(XAIMallViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
