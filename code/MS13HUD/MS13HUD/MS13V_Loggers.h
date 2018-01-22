//
//  MS13V_Loggers.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
@interface MS13V_Loggers : NSObject

+ (void)ms13fun_setVerboseLoggingEnabled:(bool)loggingEnabled;

  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
+ (void)ms13fun__verboseLog:(NSString *)format, ...;

#define il2Log(frmt, ...)  [MS13V_Loggers ms13fun__verboseLog:frmt,##__VA_ARGS__]

@end
