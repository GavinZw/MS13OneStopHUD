//
//  MS13V_Networking.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MSSuccessBlock)(NSDictionary *responseObject);
typedef void(^MSFaileBlock)(NSError *error);

@interface MS13V_Networking : NSObject

// I am focusing hard on making AR for the web a reality. This repository is where I publish the code. Contact me anytime @jerome_etienne. Stuff are still moving fast, We reached a good status tho. An article has been published on uploadvr. So I wanted to publish thus people can try it and have fun with it :) 
+ (void)ms13fun_requestReviewInfoWithUniqueId:(NSString *)uniqueId completionHandler:(void (^)(NSDictionary *response, NSError *error))completionHandler;

@end
