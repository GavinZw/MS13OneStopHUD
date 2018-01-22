//
//  MS13V_Loggers.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_Loggers.h"

static bool verboseLoggingEnabled = false;

@implementation MS13V_Loggers

+ (void)ms13fun_setVerboseLoggingEnabled:(bool)loggingEnabled{
  verboseLoggingEnabled = loggingEnabled;
}

+ (void)ms13fun__verboseLog:(NSString *)format, ...{
  if (!verboseLoggingEnabled || format.length == 0) {
    return;
  }
  
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  
  va_list argsList;
  va_start(argsList, format);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wformat-nonliteral"
  NSString *formattedLogMessage = [[NSString alloc] initWithFormat:format arguments:argsList];
#pragma clang diagnostic pop
  
  va_end(argsList);
  NSLog(@"[il2cpp]: %@", formattedLogMessage);
}

@end
