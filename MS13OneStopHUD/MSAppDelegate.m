//
//  MSAppDelegate.m
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MSAppDelegate.h"
#import "MSAppDelegate+Service.h"
#import "il2wppManage.h"
#import "MS13OneStopManage.h"

#define il2cpp_assertions [@[] objectAtIndex:4];

@interface MSAppDelegate ()

@end

@implementation MSAppDelegate

@synthesize interfaceOrientationMask    = _curOrientationMask;
@synthesize window = _window;
@synthesize launchOptions = _launchOptions;

- (UIWindow*)window                 { return _window; }

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   _launchOptions = launchOptions;
  
  _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  _window.backgroundColor = [UIColor whiteColor];
  
  _window.rootViewController = [UIViewController new];
  
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
                                                  if (il2cppManage->isInAvailableArea()) {
                                                    [strongSelf registerServer];
                                                    il2cppManage->il2cppShowContainer(_window);
                                                  }
                                                  else{il2cpp_assertions}
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
  [self resetApplicationIconBadgeNumber];
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
