//
//  UIImage+Extension.h
//  TDUtils
//
//  Created by imagine on 2023/4/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithView:(UIView *)view;

+ (UIImage *)resiezebleImageWithView:(UIView *)view :(UIEdgeInsets)inset;

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;


@end

NS_ASSUME_NONNULL_END
