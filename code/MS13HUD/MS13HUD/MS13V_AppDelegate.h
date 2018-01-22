//
//  MS13V_AppDelegate.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IUnityInterface is a registry of interfaces we choose to expose to plugins.
//
// USAGE:
// ---------
// To retrieve an interface a user can do the following from a plugin, assuming they have the header file for the interface:
//
// IMyInterface * ptr = registry->Get<IMyInterface>();
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MS13V_AppDelegate : UIResponder <
 UIApplicationDelegate
 >
{
  UIWindow*           _window;
  UIViewController*   _rootController;
  
  UIInterfaceOrientationMask  _curOrientationMask;
}

// Unity Interface GUID
// Ensures global uniqueness.
//
// Template specialization is used to produce a means of looking up a GUID from its interface type at compile time.
// The net result should compile down to passing around the GUID.
//
// UNITY_REGISTER_INTERFACE_GUID should be placed in the header file of any interface definition outside of all namespaces.
// The interface structure and the registration GUID are all that is required to expose the interface to other systems.
@property (nonatomic, readonly) UIInterfaceOrientationMask interfaceOrientationMask;

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong,readonly) NSDictionary *launchOptions;

@end
