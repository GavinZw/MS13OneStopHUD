//
//  MS13V_GameViewController.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MS13V_GameViewController : UINavigationController

// Unity Interface GUID
// Ensures global uniqueness.
//
// Template specialization is used to produce a means of looking up a GUID from its interface type at compile time.
// The net result should compile down to passing around the GUID.
//
// UNITY_REGISTER_INTERFACE_GUID should be placed in the header file of any interface definition outside of all namespaces.
// The interface structure and the registration GUID are all that is required to expose the interface to other systems.
+ (UINavigationController *)ms13fun_windowRootViewController;

@end
