# 关于Bmob后台数据配置

    注意: Bmob表名强制使用 'onestop' 
    表结构:
      {
        reviewStatus: 2               ->String         // reviewStatus 2: 审核完成
        isInAvailableTabbar : true,   ->Boolean        // 是否可以允许显示Tabbar
        isInAvailableImage  : false,  ->String         // 是否可以允许显示ImageAlert

        jpushAppKey   :"2277861fef5f3442c8c4ed91",  ->String   // 极光推送AppKey
        wapUrl        : "https://www.xxx.com",      ->String   // 加载WebView的地址
        appStoreUrl   : "https://www.xxx.com",      ->String   // 跳转AppStoreU地址
        imageAlertUrl : ""                          ->String   // 图片弹框的下载地址
      }

## 图片弹框的图片URL(测试)
   https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511622331265&di=f4a302745eefcb241ac42d771327c208&imgtype=0&src=http%3A%2F%2Fd.paper.i4.cn%2Fmax%2F2016%2F07%2F08%2F11%2F1467947204022_175808.jpg

##
lipo -create Release-iphoneos/libil2wpp.a  Release-iphonesimulator/libil2wpp.a -output libil2wpp.a

