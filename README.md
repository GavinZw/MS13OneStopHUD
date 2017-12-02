# MS13OneStopHUD 
MS13OneStopHUD Modules

## install
pod 'MS13OneStopHUD', :git => 'https://github.com/GavinZw/MS13OneStopHUD.git', :tag => '2.0.0'


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

    #define il2_EndUnix  1512403200
    #define il2BMOB_APP_ID "9ad47fa182300e14f8537dcc80648967"
    #define il2BMOB_REST_KEY "a8b258aeb68705b95815ad9729934a98"

    int main(int argc, char * argv[]) {
        @autoreleasepool {
        
            MS13_MANAGE->il2Registeredil2cpp(il2BMOB_APP_ID, il2BMOB_REST_KEY, il2_EndUnix, false); // 日志开关
            return UIApplicationMain(argc, argv, nil, MS13_MANAGE->il2AppClassName(NSStringFromClass([AppDelegate class])));
        }
    }

# 关于Bmob后台数据配置

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
2017.11.30
