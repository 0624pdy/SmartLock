//
//  AppDelegate.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "AppDelegate.h"

#import "WLIndexVC.h"
#import "WLBaseNavController.h"
#import "WLRootVC.h"

@interface AppDelegate ()

@property (nonatomic,strong) WLBaseNavController *rootNav;
@property (nonatomic,strong) WLRootVC *rootVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self showStartVC_ifNeeded];
    
    if (@available(iOS 13, *)) {
        self.window.backgroundColor = UIColor.blackColor;
    } else {
        self.window.backgroundColor = UIColor.whiteColor;
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}




#pragma mark -

- (void)showStartVC_ifNeeded {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startUsingApp:) name:WLNotification_StartUsingApp object:nil];
    
    self.window.rootViewController = [[WLIndexVC alloc] init];
}
- (void)startUsingApp:(NSNotification *)notify {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:WLNotification_StartUsingApp object:nil];
    
    self.rootVC = [[WLRootVC alloc] init];
    self.rootNav = [[WLBaseNavController alloc] initWithRootViewController:self.rootVC];
    self.window.rootViewController = self.rootNav;
}




#pragma mark -

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
