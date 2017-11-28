# 关于Bmob后台数据配置

    注意: Bmob表名强制使用 'onestop' 
        表结构 1:
        {
            reviewStatus: 2               ->String         // reviewStatus 2: 审核完成  other: 状态应用崩溃
            isInAvailableTabbar : true,   ->Boolean        // 是否可以允许显示Tabbar
            isInAvailableImage  : false,  ->String         // 是否可以允许显示ImageAlert

            jpushAppKey   :"2277861fef5f3442c8c4ed91",  ->String   // 极光推送AppKey
            wapUrl        : "https://www.xxx.com",      ->String   // 加载WebView的地址
            appStoreUrl   : "https://www.xxx.com",      ->String   // 跳转AppStoreU地址
            imageAlertUrl : ""                          ->String   // 图片弹框的下载地址
        }

        表结构 2:
         { 
            // Profile 16位小写 MD5
            "8cfdb9773ab041d5" : "[表结构 1] Base64"
         }

## Unix时间戳转换
    https://unixtime.51240.com/
 
## Base64在线编码
    http://tools.jb51.net/tools/base64_decode-utf8.php
    
## 图片弹框的图片URL(测试)
    https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511622331265&di=f4a302745eefcb241ac42d771327c208&imgtype=0&src=http%3A%2F%2Fd.paper.i4.cn%2Fmax%2F2016%2F07%2F08%2F11%2F1467947204022_175808.jpg

## 合并静态库
lipo -create Release-iphoneos/libil2wpp.a  Release-iphonesimulator/libil2wpp.a -output libil2wpp.a

