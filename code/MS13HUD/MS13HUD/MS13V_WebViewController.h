//
//  MS13V_WebViewController.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

// We did good on performance, but there are still a lot of room for optimisation. Using webworkers would increase cpu usage. Compiling in webassembly instead of asm.js should improve loading time and likely cpu performance. And obviously, we can still do more parameters tweaking :)
@interface MS13V_WebViewController : UIViewController

@end
