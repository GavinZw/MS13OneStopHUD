//
//  MS13V_AppDelegate.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_AppDelegate.h"
#import "MS13V_AppDelegate+Service.h"
#import "MS13V_Manage.h"
#import "MS13V_LaunchViewController.h"

#define il2cpp_assertions [@[] objectAtIndex:4];

@interface MS13V_AppDelegate ()

@end

// Generic version of GetUnityInterfaceGUID to allow us to specialize it
// per interface below. The generic version has no actual implementation
// on purpose.
@implementation MS13V_AppDelegate

@synthesize interfaceOrientationMask    = _curOrientationMask;
@synthesize window = _window;
@synthesize launchOptions = _launchOptions;

- (UIWindow*)window                 { return _window; }

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   _launchOptions = launchOptions;
  
  _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  _window.backgroundColor = [UIColor whiteColor];
  
  _window.rootViewController = [MS13V_LaunchViewController new];
  
   [self addObserver];
   [_window makeKeyAndVisible];

   return YES;
}

- (void)addObserver{
    __weak typeof(self) weakSelf = self;
  [[NSNotificationCenter defaultCenter] addObserverForName:il2cppNoticeName
                                                    object:nil
                                                     queue:[NSOperationQueue mainQueue]
                                                usingBlock:^(NSNotification * note) {
                                                   __strong __typeof(self) strongSelf = weakSelf;
                                                   NSInteger events = [note.object integerValue];
                                                   if (events == 2) {
                                                      if (il2cppManage->isInAvailableArea()) {
                                                        [strongSelf ms13fun_registerServer];
                                                        il2cppManage->il2cppShowContainer(_window);
                                                      }
                                                   }
                                                   else if (events == 3){il2cpp_assertions}
                                                   else{}
                                                }];
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
  [self ms13fun_resetApplicationIconBadgeNumber]; 
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - 屏幕方向代理

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
  return (_curOrientationMask == UIInterfaceOrientationMaskLandscapeRight)? UIInterfaceOrientationMaskLandscapeRight :UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate{return NO;}

@end
