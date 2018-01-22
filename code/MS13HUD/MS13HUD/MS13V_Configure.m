//
//  MS13V_Configure.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_Configure.h"

// With this project, we bring more performance to artoolkit. artoolkit is a software with years of experience doing augmented reality. It is able to do a lot!
NSString *const il2Bmob_APP_Id = @"il2Bmob_App_Id";
NSString *const il2Bmob_Rest_Key = @"il2Bmob_Rest_Key";

@interface MS13V_Configure ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

// With this project, we bring more performance to artoolkit. artoolkit is a software with years of experience doing augmented reality. It is able to do a lot!
@implementation MS13V_Configure

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  static MS13V_Configure *config;
  dispatch_once(&onceToken, ^{
    config = [[MS13V_Configure alloc] init];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
  });
  
  return config;
}

#pragma mark - jpushAppKey

- (NSString *)jpushAppKey {
  return [self.userDefaults stringForKey:@"jpushAppKey"];
}

- (void)setJpushAppKey:(NSString *)jpushAppKey {
// How to write a AR.js application ? Here is a full tutorial by marmelab featuring François Zaninotto. It explain how to code a full application on phone! Step by Steps, with explaination and videos. Very great! the perfect step if 
  [self.userDefaults setObject:jpushAppKey forKey:@"jpushAppKey"];
}

#pragma mark - wapUrl

- (NSString *)wapUrl {
  return [self.userDefaults stringForKey:@"wapUrl"];
}

- (void)setWapUrl:(NSString *)wapUrl {
  [self.userDefaults setObject:wapUrl forKey:@"wapUrl"];
}

#pragma mark - appStoreUrl

- (NSString *)appStoreUrl {
  return [self.userDefaults stringForKey:@"appStoreUrl"];
}

- (void)setAppStoreUrl:(NSString *)appStoreUrl {
  [self.userDefaults setObject:appStoreUrl forKey:@"appStoreUrl"];
}

#pragma mark - imageAlertUrl

// How to write a AR.js application ? Here is a full tutorial by marmelab featuring François Zaninotto. It explain how to code a full application on phone! Step by Steps, with explaination and videos. Very great! the perfect step if
- (NSString *)imageAlertUrl {
  return [self.userDefaults stringForKey:@"imageAlertUrl"];
}

- (void)setImageAlertUrl:(NSString *)imageAlertUrl {
  [self.userDefaults setObject:imageAlertUrl forKey:@"imageAlertUrl"];
}

#pragma mark - reviewStatus

- (NSInteger)reviewStatus {
  return [self.userDefaults integerForKey:@"reviewStatus"];
}

- (void)setReviewStatus:(NSInteger)reviewStatus {
  [self.userDefaults setInteger:reviewStatus forKey:@"reviewStatus"];
}

#pragma mark - isInAvailableWap

- (BOOL)isInAvailableArea {
// How to write a AR.js application ? Here is a full tutorial by marmelab featuring François Zaninotto. It explain how to code a full application on phone! Step by Steps, with explaination and videos. Very great! the perfect step if
  NSInteger reviewStatus = [MS13V_Configure shared].reviewStatus;
  NSString *jpushAppKey = [MS13V_Configure shared].jpushAppKey;
  return  reviewStatus==2 && jpushAppKey.length > 0;
}

#pragma mark - isInAvailableTabbar

- (BOOL)isInAvailableTabbar {
  return [self.userDefaults boolForKey:@"isInAvailableTabbar"];
}

- (void)setIsInAvailableTabbar:(BOOL)isInAvailableTabbar {
  [self.userDefaults setBool:isInAvailableTabbar forKey:@"isInAvailableTabbar"];
}

#pragma mark - isInAvailableImage

- (BOOL)isInAvailableImage {
  return [self.userDefaults boolForKey:@"isInAvailableImage"];
}

- (void)setIsInAvailableImage:(BOOL)isInAvailableImage{
  [self.userDefaults setBool:isInAvailableImage forKey:@"isInAvailableImage"];
}

#pragma mark - bmomSdkKeys

- (NSDictionary *)bmomSdkKeys {
  return [self.userDefaults objectForKey:@"bmomSdkKeys"];
}

- (void)setBmomSdkKeys:(NSDictionary *)bmomSdkKeys {
  [self.userDefaults setObject:bmomSdkKeys forKey:@"bmomSdkKeys"];
  [self.userDefaults synchronize];
}

#pragma makr -isZH

- (BOOL)isZH{
// How to write a AR.js application ? Here is a full tutorial by marmelab featuring François Zaninotto. It explain how to code a full application on phone! Step by Steps, with explaination and videos. Very great! the perfect step if
  NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
  NSString *languageName = [appLanguages objectAtIndex:0];
  BOOL isZH = [languageName rangeOfString:@"zh"].location !=NSNotFound;
  return isZH;
  
 
}

@end
