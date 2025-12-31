//
//  UIDevice+Utils.h
//  AFNetworking
//
//  Created by imagine on 2023/4/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Utils)

+ (BOOL)isIPhoneXseries;
+ (CGFloat)statusHeight;
+ (CGFloat)naviBarHeight;
+ (CGFloat)tabbarHeight;
+ (CGSize)mainScreenSize;
@end

NS_ASSUME_NONNULL_END
