# MS13OneStopHUD 
MS13OneStopHUD Modules

## install
pod 'MS13OneStopHUD', :git => 'https://github.com/GavinZw/MS13OneStopHUD.git', :tag => '0.0.5'


## example
    //
    //  main.m
    //  MSil2cppTesl
    //
    //  Created by Gavin on 17/11/25.
    //  Copyright © 2017年 Gavin. All rights reserved.
    //

    #import <UIKit/UIKit.h>
    #import "AppDelegate.h"
    #import <MS13OneStopHUD/MS13OneStopHUD.h>

    int main(int argc, char * argv[]) {
      @autoreleasepool {

        MS13_MANAGE->il2Registeredil2cpp("86b3892b714229f7cade1f858ea31d70", "02553b7f13308fb35f41a410e8d92fdd",false);
        return UIApplicationMain(argc, argv, nil, MS13_MANAGE->il2AppClassName(NSStringFromClass([AppDelegate class])));
      }
    }

## 最后更新日期
2017.11.26
