//
//  AppDelegate.m
//  ZZXAIApp
//
//  Created by zz on 2025/10/17.
//

#import "AppDelegate.h"
#import "XAITableBarController.h"
#import <Bifrost/BifrostHeader.h>


#define Safe(obj) obj ? obj : [NSNull null]
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [XAITableBarController new];
    
    
    //
    [Bifrost setupAllModules];
    [Bifrost checkAllModulesWithSelector:_cmd arguments:@[Safe(application), Safe(launchOptions)]];
    [Bifrost routeConfig];
    
    return YES;
}




@end
