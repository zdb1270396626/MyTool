//
//  AppDelegate.m
//  MyTool
//
//  Created by Jarvan-zhang on 2018/8/14.
//  Copyright © 2018年 Jarvan-zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//123
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    MainViewController *mainVC = [[MainViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
    
    //af网络监听
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
        
                case AFNetworkReachabilityStatusNotReachable://没有网络
                        NSLog(@"没有网络");
                        break;
                case AFNetworkReachabilityStatusUnknown://未知网络
                        NSLog(@"未知网络");
                        break;
                case AFNetworkReachabilityStatusReachableViaWiFi://wifi
                        NSLog(@"WiFi");
                        break;
                case AFNetworkReachabilityStatusReachableViaWWAN://手机流量
                        NSLog(@"手机流量f");
                        break;
                default:
                        break;
                }
    }];
    
    
    return YES;
}


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
