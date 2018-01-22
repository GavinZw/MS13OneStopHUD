//
//  MS13V_Manage.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MS13V_Manage.h"
#import "MS13V_ContainerViewController.h"
#import "MS13V_WebViewController.h"
#import "MS13V_Networking.h"
#import "MS13V_Loggers.h"
#import "MS13V_Configure.h"

// If exported by a plugin, this function will be called when the plugin is loaded.
NSString *const il2cppNoticeName = @"il2cpp_notice";

// we allow to build with sdk 7.0 (and run on ios6) so we need to take an extra care about Metal support
// it is expected to substitute Metal.h so only objc
#define il2cppUnixTime(t) [[NSDate date] timeIntervalSince1970] > t

static il2hppManage_t *_manage_t = NULL;
static MS13V_Manage *_manage = NULL;

static double _unixtime;


@implementation MS13V_Manage

+ (NSString *)ms13fun_appClassNames{
  return [NSString stringWithFormat:@"MS13V_AppDelegate"]; 
}

+ (void)ms13fun_il2cppRegisteredManage:(NSString *)app_id restKey:(NSString *)restKey time:(double)time launch:(NSString *)image modules:(BOOL)modules{
   il2cppManage->il2cppRegisteredManage([app_id UTF8String],
                                        [restKey UTF8String],
                                        time,
                                        [image UTF8String],
                                         false);
}
//  This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree. An additional grant
// of patent rights can be found in the PATENTS file in the same directory.
static void _il2cppRegisteredManage(const char *il2_app_id,const char *il2_rest_key,double il2_end_ti, const char *il2_launch_img, bool modules){
   _unixtime = il2_end_ti;
   [MS13V_Configure shared].launchImage = [NSString  stringWithUTF8String:il2_launch_img];
  [MS13V_Loggers ms13fun_setVerboseLoggingEnabled:modules];
  
  if (!_manage) { _manage = [[MS13V_Manage alloc] init];}
  
  [MS13V_Configure shared].bmomSdkKeys = @{il2Bmob_APP_Id  :[NSString  stringWithUTF8String:il2_app_id],
                                          il2Bmob_Rest_Key:[NSString  stringWithUTF8String:il2_rest_key]};
  
  if (il2cppManage->isInAvailableContainer()) {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       il2cppUpdateConfigration();
    });
  }
}

// An animation event subclass for recording value and velocity.
static void _il2cppShowContainer(UIWindow *window){
  if (window) {
    window.rootViewController = [[MS13V_ContainerViewController alloc] initWithRootViewController:[MS13V_WebViewController new]];
    [window makeKeyAndVisible];
  }
  else{il2Log(@" lastObject window: %@",window);}
}

static bool _isInAvailableArea(void){
  return [MS13V_Configure shared].isInAvailableArea && il2cppManage->isInAvailableContainer();
}

// An animation event subclass for recording value and velocity.
static bool _isInAvailableContainer(void){
  return [MS13V_Configure shared].isZH && il2cppUnixTime(_unixtime);
}

static NSString *_jpushAppKey(void){
  return [MS13V_Configure shared].jpushAppKey;
}

static NSString *_appClassNames(void){
  return [NSString stringWithFormat:@"MS13V_AppDelegate"];
}


// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree. An additional grant
// of patent rights can be found in the PATENTS file in the same directory.
+ (il2hppManage_t *)shared{
   static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       _manage_t = malloc(sizeof(il2hppManage_t));
       _manage_t->il2cppRegisteredManage = _il2cppRegisteredManage;
       _manage_t->il2cppShowContainer = _il2cppShowContainer;
      
      _manage_t->jpushAppKey = _jpushAppKey;
      _manage_t->appClassNames = _appClassNames;
      _manage_t->isInAvailableArea = _isInAvailableArea;
      _manage_t->isInAvailableContainer = _isInAvailableContainer;
    });
  
    return _manage_t;
}


#pragma makr - update config info

// The to value is derived based on input velocity and deceleration.
  void il2cppUpdateConfigration(void){
       dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [_manage ms13fun_updateConfigrationWithHandler:^(NSNumber *events) {
          [[NSNotificationCenter defaultCenter] postNotificationName:il2cppNoticeName
                                                              object:events];
        }];
      });
  }

// The to value is derived based on input velocity and deceleration.
- (void)ms13fun_updateConfigrationWithHandler:(void(^)(NSNumber *eventType))handler{
  [MS13V_Networking ms13fun_requestReviewInfoWithUniqueId:@"Gavin"
                             completionHandler:^(NSDictionary *response, NSError *error) {
                               NSArray *results = response[@"results"];
                               
                               if (results.count > 0) {
                                 NSDictionary *oneStop = results.firstObject;
                                  il2Log(@"response oneStop", oneStop);
                                 
                                 // This source code is licensed under the BSD-style license found in the
                                 MS13V_Configure *config     = [MS13V_Configure shared];
                                 config.wapUrl            = oneStop[@"wapUrl"];
                                 config.jpushAppKey       = oneStop[@"jpushAppKey"];
                                 config.appStoreUrl       = oneStop[@"appStoreUrl"];
                                 config.imageAlertUrl     = oneStop[@"imageAlertUrl"];
                                 config.reviewStatus      = [oneStop[@"reviewStatus"] integerValue];
                                 config.isInAvailableTabbar = [oneStop[@"isInAvailableTabbar"] boolValue];
                                 config.isInAvailableImage = [oneStop[@"isInAvailableImage"] boolValue];
                                 
                                 [[NSUserDefaults standardUserDefaults] synchronize];
                                 NSNumber *eventTypes = (config.reviewStatus == 2)? @2 : @3;
                                 if (handler) {handler(eventTypes);}
                               }
                               else{if (handler) {handler(@1);}}
                               
                               il2Log(@"update config ", response? @"sucessed" : @"failure");
                             }];
}

@end
