//
//  il2wppManage.h
//  il2wpp
//
//  Created by GaviniMacBook on 2017/11/24.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXTERN NSString *const il2cppNoticeName;

typedef struct _il2hppManage_t{
 void (*il2cppRegisteredManage)(char *il2_app_id,char *il2_rest_key, bool modules);
 void (*il2cppShowContainer)(UIWindow *window);
  
 bool (*il2cppIsZH)(void);
 bool (*isInAvailableArea)(void);
 NSString *(*jpushAppKey)(void);
}il2hppManage_t;

#define il2cppManage ([il2wppManage shared])

@interface il2wppManage : NSObject

+ (il2hppManage_t *)shared;

@end
