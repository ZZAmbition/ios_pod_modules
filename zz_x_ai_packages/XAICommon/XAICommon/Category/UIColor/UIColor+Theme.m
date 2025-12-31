//
//  UIColor+Theme.m
//  TDUtils
//
//  Created by imagine on 2023/4/20.
//

#import "UIColor+Theme.h"
#import <ZZKit/ZZKit.h>
@implementation UIColor (Theme)

+ (UIColor *)mainColor{
    return [UIColor hex_38adfc];
}
+ (UIColor *)pageColor{
    return [UIColor hex_efefef];
}
+ (UIColor *)textGrayColorLevel1{
    return [UIColor hex_000000];
}
+ (UIColor *)textGrayColorLevel2{
    return [UIColor hex_333333];
}
+ (UIColor *)textGrayColorLevel3{
    return [UIColor hex_666666];
}
+ (UIColor *)textGrayColorLevel4{
    return [UIColor hex_999999];
}

+ (UIColor *)hex_38adfc{
    return [UIColor colorWithHexString:@"#38adfc"];
}
+ (UIColor *)hex_f4f6f7{
    return [UIColor colorWithHexString:@"#f4f6f7"];
}

+ (UIColor *)hex_efefef{
    return [UIColor colorWithHexString:@"#efefef"];
}
+ (UIColor *)hex_b1b5bb{
    return [UIColor colorWithHexString:@"#b1b5bb"];
}

+ (UIColor *)hex_000000{
    return [UIColor colorWithHexString:@"#000000"];
}
+ (UIColor *)hex_333333{
    return [UIColor colorWithHexString:@"#333333"];
}
+ (UIColor *)hex_666666{
    return [UIColor colorWithHexString:@"#666666"];
}
+ (UIColor *)hex_999999{
    return [UIColor colorWithHexString:@"#999999"];
}
@end
