//
//  MSAppDelegate+Service.m
//  MS13OneStopHUD
//
//  Created by Gavin on 17/11/25.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MSAppDelegate+Service.h"
#import "il2wppManage.h"

@implementation MSAppDelegate (Service)

- (void)registerServer{
  [self registerForJpushWithAppKey:il2cppManage->jpushAppKey() andChannelId:@"appstore"];
}

- (void)registerForJpushWithAppKey:(NSString *)appKey andChannelId:(NSString *)channelId {
  //Required
  //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
  JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
  entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
  if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
    // 可以添加自定义categories
    // NSSet<UNNotificationCategory *> *categories for iOS10 or later
    // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
  }
  [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
  
  
  // Required
  // init Push
  // notice: 2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil
  // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
  [JPUSHService setupWithOption:self.launchOptions
                         appKey:appKey
                        channel:channelId
               apsForProduction:YES];
}

#pragma mark - application

- (void)resetApplicationIconBadgeNumber{
  [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
  if (il2cppManage->jpushAppKey().length > 0) {
      [JPUSHService setBadge:0];
  }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
  if (il2cppManage->jpushAppKey().length>0) {
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
  }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
  if (il2cppManage->jpushAppKey().length>0) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
  if (il2cppManage->jpushAppKey().length>0) {
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
  }
  [self resetApplicationIconBadgeNumber];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  //Optional
  NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
  // Required
  NSDictionary * userInfo = notification.request.content.userInfo;
  if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
  // Required
  NSDictionary * userInfo = response.notification.request.content.userInfo;
  if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler();  // 系统要求执行这个方法
}

@end
