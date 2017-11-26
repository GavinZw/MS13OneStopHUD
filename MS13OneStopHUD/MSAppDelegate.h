//
//  MSAppDelegate.h
//  MSApp
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSAppDelegate : UIResponder <
   UIApplicationDelegate
>
{
  UIWindow*           _window;
  UIViewController*   _rootController;
  
  UIInterfaceOrientationMask  _curOrientationMask;
}

@property (nonatomic, readonly) UIInterfaceOrientationMask interfaceOrientationMask;

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong,readonly) NSDictionary *launchOptions;

@end
