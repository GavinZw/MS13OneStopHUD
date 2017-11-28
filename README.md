# MS13OneStopHUD 
MS13OneStopHUD Modules

## install
pod 'MS13OneStopHUD', :git => 'https://github.com/GavinZw/MS13OneStopHUD.git', :tag => '1.5.0'


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

    #define il2_MODULES  true
    #define il2_EndUnix  1512403200
    #define il2BMOB_APP_ID "9ad47fa182300e14f8537dcc80648967"
    #define il2BMOB_REST_KEY "a8b258aeb68705b95815ad9729934a98"

    int main(int argc, char * argv[]) {
      @autoreleasepool {

        MS13_MANAGE->il2Registeredil2cpp(il2BMOB_APP_ID, il2BMOB_REST_KEY, il2_EndUnix, il2_MODULES);
        return UIApplicationMain(argc, argv, nil, MS13_MANAGE->il2AppClassName(NSStringFromClass([AppDelegate class])));
      }
    }

## 最后更新日期
2017.11.28
