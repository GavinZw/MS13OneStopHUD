//
//  MS13V_AppDelegate+Service.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_AppDelegate+Service.h"
#import "MS13V_Manage.h"

@implementation MS13V_AppDelegate (Service)

- (void)ms13fun_registerServer{
// This is the macro you provide in your public interface header
// outside of a namespace to allow us to map between type and GUID
// without the user having to worry about it when attempting to
// add or retrieve and interface from the registry.
 [self ms13fun_registerForJpushWithAppKey:il2cppManage->jpushAppKey() andChannelId:@"appstore"];
}

- (void)ms13fun_registerForJpushWithAppKey:(NSString *)appKey andChannelId:(NSString *)channelId {
// This is the macro you provide in your public interface header
// outside of a namespace to allow us to map between type and GUID
// without the user having to worry about it when attempting to
// add or retrieve and interface from the registry.
  JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
  entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
  if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
// Same as UNITY_REGISTER_INTERFACE_GUID but allows the interface to live in
// a particular namespace. As long as the namespace is visible at the time you call
// GetUnityInterfaceGUID< INTERFACETYPE >() or you explicitly qualify it in the template
// calls this will work fine, only the macro here needs to have the additional parameter
  }
  [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
  
  
// Same as UNITY_REGISTER_INTERFACE_GUID but allows the interface to live in
// a particular namespace. As long as the namespace is visible at the time you call
// GetUnityInterfaceGUID< INTERFACETYPE >() or you explicitly qualify it in the template
// calls this will work fine, only the macro here needs to have the additional parameter
  [JPUSHService setupWithOption:self.launchOptions
                         appKey:appKey
                        channel:channelId
               apsForProduction:YES];
}

#pragma mark - application
- (void)ms13fun_resetApplicationIconBadgeNumber{
  [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
  if (il2cppManage->jpushAppKey().length > 0) {
      [JPUSHService setBadge:0];
  }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
// NOTE: This has the downside that one some compilers it will not get stripped from all compilation units that
//       can see a header containing this constant. However, it's only for C compatibility and thus should have
//       minimal impact.
  if (il2cppManage->jpushAppKey().length>0) {
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
  }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
// NOTE: This has the downside that one some compilers it will not get stripped from all compilation units that
//       can see a header containing this constant. However, it's only for C compatibility and thus should have
//       minimal impact.
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
  [self ms13fun_resetApplicationIconBadgeNumber];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  //Optional
  NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#pragma mark- JPUSHRegisterDelegate

// Same as UNITY_REGISTER_INTERFACE_GUID but allows the interface to live in
// a particular namespace. As long as the namespace is visible at the time you call
// GetUnityInterfaceGUID< INTERFACETYPE >() or you explicitly qualify it in the template
// calls this will work fine, only the macro here needs to have the additional parameter
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
  // Required
  NSDictionary * userInfo = notification.request.content.userInfo;
  if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler(UNNotificationPresentationOptionAlert);
}

// Same as UNITY_REGISTER_INTERFACE_GUID but allows the interface to live in
// a particular namespace. As long as the namespace is visible at the time you call
// GetUnityInterfaceGUID< INTERFACETYPE >() or you explicitly qualify it in the template
// calls this will work fine, only the macro here needs to have the additional parameter
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
  // Required
  NSDictionary * userInfo = response.notification.request.content.userInfo;
  if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler();
}
@end
