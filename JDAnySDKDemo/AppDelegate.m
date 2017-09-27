//
//  AppDelegate.m
//  JDAnySDKDemo
//
//  Created by huguan-mac01 on 2017/9/22.
//  Copyright © 2017年 huguan-mac01. All rights reserved.
//

#import "AppDelegate.h"
#import <JDAnySDK/JDAnySDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //聚合参数
    [[JDAnySDKParameters sharedJDSDKParameters] setAppId:@"50"];
    [[JDAnySDKParameters sharedJDSDKParameters] setAppKey:@"1060420dde8366fc59396c317d789bd6"];
    
    [[JDAnySDKParameters sharedJDSDKParameters] setLogData:NO];
    [[JDAnySDKParameters sharedJDSDKParameters] setDebug:NO];
    
    //玖鼎参数
    JDJdSDKInitModel *jdSDKInitModel = [JDJdSDKInitModel new];
    [jdSDKInitModel setGameId:@"8"];
    [jdSDKInitModel setSecretKey:@"54e5b8ef8b79fbe202792025c975d787"];
    [jdSDKInitModel setTdAppId:@"8B2853CEA992413AB5BFE96DEF372B16"];
    [[JDAnySDKParameters sharedJDSDKParameters] setJdSDKInitModel:jdSDKInitModel];
    
    [[JDAnySDKParameters sharedJDSDKParameters] setJdPlatformType:JDJDPlatform];
    
    [[JDAnySDK sharedInstance] jdInitWithSDKParameters:[JDAnySDKParameters sharedJDSDKParameters]];

    return YES;
}
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return [[JDAnySDK sharedInstance] supportedInterface];
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
