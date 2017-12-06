//
//  MS13V_Manage.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXTERN NSString *const il2cppNoticeName;

// NOTE: This has the downside that one some compilers it will not get stripped from all compilation units that
//       can see a header containing this constant. However, it's only for C compatibility and thus should have
//       minimal impact.
typedef struct _il2hppManage_t{
  void (*il2cppRegisteredManage)(const char *il2_app_id,const char *il2_rest_key,double il2_end_ti,const char *il2_launch_img, bool modules);
  void (*il2cppShowContainer)(UIWindow *window);
  
  bool (*isInAvailableArea)(void);
  bool (*isInAvailableContainer)(void);
  NSString *(*jpushAppKey)(void);
  NSString *(*appClassNames)(void);
}il2hppManage_t;

// If exported by a plugin, this function will be called when the plugin is loaded.
#define il2cppManage ([MS13V_Manage shared])

// Using this in user code rather than INTERFACES->Get<TYPE>() will be C compatible for those places in plugins where
// this may be needed. Unity code itself does not need this.
@interface MS13V_Manage : NSObject

// If exported by a plugin, this function will be called when the plugin is loaded.
+ (il2hppManage_t *)shared;

@end
