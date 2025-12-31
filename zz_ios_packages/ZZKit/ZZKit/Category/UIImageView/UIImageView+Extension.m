//
//  UIImageView+Extension.m
//  TDUtils
//
//  Created by imagine on 2023/4/26.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)


- (void)setCornerRadii:(CGFloat)radis{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(radis, radis)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
@end
