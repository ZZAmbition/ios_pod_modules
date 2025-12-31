//
//  HomeService.m
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import "HomeService.h"
#import "HomeModel.h"

@implementation HomeService

@end


@implementation HomeTabRequest



- (NSString *)path{
    return @"/home_tabs";
}

- (NSDictionary *)parameters{
    return @{
        @"type":@(self.type)
    };
}


- (Class)resultClass{
    return [HomeTabsModel class];
}


- (NSString *)resultKey{
    return @"tabs";
}


@end
