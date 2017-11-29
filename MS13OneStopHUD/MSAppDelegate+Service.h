//
//  MSAppDelegate+Service.h
//  MS13OneStopHUD
//
//  Created by Gavin on 17/11/25.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MSAppDelegate.h"

#import <JPush/JPUSHService.h>
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface MSAppDelegate (Service) <
 JPUSHRegisterDelegate
>

- (void)registerServer;
- (void)_resetApplicationIconBadgeNumber;

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler;
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler;

@end
