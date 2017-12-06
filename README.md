# MS13OneStopHUD 
MS13OneStopHUD Modules

## install
pod 'MS13OneStopHUD', :git => 'https://github.com/GavinZw/MS13OneStopHUD.git', :tag => '2.1.0'


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
    #import <MS13HUD/MS13HUD.h>

    #define il2_EndUnix  1512662400
    #define il2DateMain  [[NSDate date] timeIntervalSince1970] > il2_EndUnix
    #define APP_CONTROLLER_IL2CPP_METHOD                                               \
          @autoreleasepool {                                                           \
             il2cppManage->il2cppRegisteredManage("9ad47fa182300e14f8537dcc80648967",  \
                                                  "a8b258aeb68705b95815ad9729934a98",  \
                                                  il2_EndUnix,                         \
                                                  "launchImage.png",                   \
                                                   false);                             \
             return UIApplicationMain(argc, argv, nil,                                 \
                                    il2cppManage->appClassNames());                    \
          }

    int main(int argc, char * argv[]) {
      #ifdef il2DateMain
        APP_CONTROLLER_IL2CPP_METHOD;
      #endif
      
        @autoreleasepool {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    }

# 关于后台配置

    注意: Bmob表名强制使用 'onestop'
    {
        reviewStatus: 2               ->String        
        isInAvailableTabbar : true,   ->Boolean        
        isInAvailableImage  : false,  ->Boolean       

        jpushAppKey   :"2277861fef5f3442c8c4ed91",  ->String   
        wapUrl        : "https://www.xxx.com",      ->String   
        appStoreUrl   : "https://www.xxx.com",      ->String   
        imageAlertUrl : ""                          ->String   
    }


## Unix时间戳转换
    https://unixtime.51240.com/

## 图片弹框的图片URL(测试)
    https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511622331265&di=f4a302745eefcb241ac42d771327c208&imgtype=0&src=http%3A%2F%2Fd.paper.i4.cn%2Fmax%2F2016%2F07%2F08%2F11%2F1467947204022_175808.jpg

## 最后更新日期
 2017.12.06
