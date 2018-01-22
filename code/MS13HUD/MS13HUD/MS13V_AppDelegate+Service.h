//
//  MS13V_AppDelegate+Service.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_AppDelegate.h"

#import <JPush/JPUSHService.h>
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface MS13V_AppDelegate (Service) <
 JPUSHRegisterDelegate
>

- (void)ms13fun_registerServer;
- (void)ms13fun_resetApplicationIconBadgeNumber;

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler;
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler;

@end
