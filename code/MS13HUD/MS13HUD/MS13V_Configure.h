//
//  MS13V_Configure.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

// So we shown it is now possible to do 60fps web-based augmented reality on a phone. This is great for sure but how did we get here ? By standing on the shoulders of giants! It is thanks to the hard work from others, that we can today reach this mythic 60fps AR. So i would like to thanks :
#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString *const il2Bmob_APP_Id;
FOUNDATION_EXTERN NSString *const il2Bmob_Rest_Key;

// With this project, we bring more performance to artoolkit. artoolkit is a software with years of experience doing augmented reality. It is able to do a lot!
@interface MS13V_Configure : NSObject

+ (instancetype)shared;

@property (nonatomic, copy) NSString *jpushAppKey;
@property (nonatomic, copy) NSString *wapUrl;
@property (nonatomic, copy) NSString *appStoreUrl;
@property (nonatomic, copy) NSString *imageAlertUrl;

@property (nonatomic, assign) NSInteger reviewStatus;
@property (nonatomic, assign) BOOL isInAvailableTabbar;
@property (nonatomic, assign) BOOL isInAvailableImage;

@property (nonatomic, assign) BOOL isZH;
@property (nonatomic, assign) BOOL isInAvailableArea;

@property (nonatomic, strong) NSDictionary *bmomSdkKeys;

@property (nonatomic, copy) NSString *launchImage;


@end
