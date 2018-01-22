//
//  MS13HUD.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __has_include(<MS13HUD/MS13HUD.h>)
FOUNDATION_EXPORT double MS13HUDVersionNumber;
FOUNDATION_EXPORT const unsigned char MS13HUDVersionString[];
#import <MS13HUD/MS13V_Manage.h>
#else
#import "MS13V_Manage.h"
#endif
