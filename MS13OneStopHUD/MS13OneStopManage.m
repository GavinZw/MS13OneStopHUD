//
//  MS13OneStopManage.m
//  MS13OneStopHUD
//
//  Created by Gavin on 17/11/25.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13OneStopManage.h"
#import "il2wppManage.h"

#define il2cppClassName @"MSAppDelegate"

static MSil2OneStopManage_t *_manage_t = NULL;
static NSString *_il2AppDelegateName = NULL;

@implementation MS13OneStopManage

static void _il2Registeredil2cpp(const char *b_app_id, const char *b_rest_key, double end_ti, bool modules){  
  il2cppManage->il2cppRegisteredManage(b_app_id, b_rest_key, end_ti, modules);
}

static NSString *_il2AppClassName(NSString *cc){
  return (il2cppManage->isInAvailableArea())? il2cppClassName :cc;
}

+ (MSil2OneStopManage_t *)shared{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _manage_t = malloc(sizeof(MSil2OneStopManage_t));
    _manage_t->il2Registeredil2cpp = _il2Registeredil2cpp;
    _manage_t->il2AppClassName = _il2AppClassName;
  });
  
  return _manage_t;
}

@end
