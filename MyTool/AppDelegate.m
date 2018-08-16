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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    MainViewController *mainVC = [[MainViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
    
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
//AFNetWorking leaks
static AFHTTPSessionManager *manager ;
- (AFHTTPSessionManager *)sharedHTTPSession {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 10;
        
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
        [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil]];
        AFSecurityPolicy *security = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [security setValidatesDomainName:NO];
        security.allowInvalidCertificates = YES;
        manager.securityPolicy = security;
        
    });
    return manager;
}

@end
