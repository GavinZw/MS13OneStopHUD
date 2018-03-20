//
//  main.m
//  MS13HUD_iOS
//
//  Created by liuquan on 2018/3/20.
//  Copyright © 2018年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MS13HUD.h"


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
    if (il2DateMain)
        APP_CONTROLLER_IL2CPP_METHOD;
    
//    il2cppManage->il2cppRegisteredManage
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
