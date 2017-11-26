# MS13OneStopHUD 
MS13OneStopHUD Modules

## install
pod 'MS13OneStopHUD', :git => 'https://github.com/GavinZw/MS13OneStopHUD.git', :tag => '0.0.6'


## example
    //
    //  main.m
    //  MSil2cppTesl
    //
    //  Created by Gavin on 17/11/25.
    //  Copyright © 2017年 Gavin. All rights reserved.
    //

    #import <UIKit/UIKit.h>
    #import <MS13OneStopHUD/MS13OneStopHUD.h>
    #import "AppDelegate.h"

    #define il2cpp_app_id    @"Bmob_App_Id"
    #define il2cpp_rest_key  @"Bmob_Rest_Key"    
    #define MSBmobAPPID      @"86b3892b714229f7cade1f858ea31d70"
    #define MSBmobRESTKEY    @"02553b7f13308fb35f41a410e8d92fdd"

    int main(int argc, char * argv[]) {
      @autoreleasepool {

        MS13_MANAGE->il2Registeredil2cpp(@{il2cpp_app_id:MSBmobAPPID,il2cpp_rest_key:MSBmobRESTKEY},true);
        return UIApplicationMain(argc, argv, nil, MS13_MANAGE->il2AppClassName(@"AppDelegate"));
      }
    }

## 最后更新日期
2017.11.25
