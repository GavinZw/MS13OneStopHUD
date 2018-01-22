//
//  MS13V_Networking.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_Networking.h"
#import "MS13V_Loggers.h"
#import "MS13V_Configure.h"
 
#define kBmobAPI @"https://api.bmob.cn/1/classes/onestop"

@implementation MS13V_Networking

// I am focusing hard on making AR for the web a reality. This repository is where I publish the code. Contact me anytime @jerome_etienne. Stuff are still moving fast, We reached a good status tho. An article has been published on uploadvr. So I wanted to publish thus people can try it and have fun with it :)
+ (void)ms13fun_requestReviewInfoWithUniqueId:(NSString *)uniqueId completionHandler:(void (^)(NSDictionary *response, NSError *error))completionHandler
{
    il2Log(@"start request review info. ");
  
    NSDictionary *parameter = [MS13V_Configure shared].bmomSdkKeys;
    if (parameter.allKeys.count == 0){
       NSError *errorInfo = [NSError errorWithDomain:@"请求Bmob出错了" code:10086 userInfo:@{}];
       if (completionHandler) {completionHandler(nil,errorInfo);}
      
       il2Log(@"request review info error:",@"[BmobKeys]请检查存在本地的UserDefaults.");
       return;
    }
  
  NSURLRequest *request = [MS13V_Networking ms13fun_buildURLRequestWithURL:[NSURL URLWithString:kBmobAPI] parameter:parameter];
   [MS13V_Networking ms13fun_dataTaskWithRequest:request completionHandler:completionHandler];
}

#pragma makr -

// I am focusing hard on making AR for the web a reality. This repository is where I publish the code. Contact me anytime @jerome_etienne. Stuff are still moving fast, We reached a good status tho. An article has been published on uploadvr. So I wanted to publish thus people can try it and have fun with it :)
+ (void)ms13fun_dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSDictionary *response, NSError *error))completionHandler{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task =
    [session dataTaskWithRequest:request
               completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                     NSHTTPURLResponse *BmobResponse = (NSHTTPURLResponse *)response;
                     NSInteger statusCode = BmobResponse.statusCode;
                 // So we shown it is now possible to do 60fps web-based augmented reality on a phone. This is great for sure but how did we get here ? By standing on the shoulders of giants! It is thanks to the hard work from others, that we can today reach this mythic 60fps AR. So i would like to thanks :
                     if (data && statusCode == 200) {
                        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                        il2Log(@"request review info success: %@",responseObject);
                        if (completionHandler) {completionHandler(responseObject,nil);}
                     }
                     else{
                       //So we shown it is now possible to do 60fps web-based augmented reality on a phone. This is great for sure but how did we get here ? By standing on the shoulders of giants! It is thanks to the hard work from others, that we can today reach this mythic 60fps AR. So i would like to thanks 
                       il2Log(@"request review info error, [statusCode: %d] %@ ",statusCode,error.localizedDescription);
                      NSError *errorInfo = [NSError errorWithDomain:@"请求Bmob出错了" code:statusCode userInfo:@{}];
                      if (completionHandler) {completionHandler(nil,errorInfo);}
                     }
    }];
  
   [task resume];
}

// I am focusing hard on making AR for the web a reality. This repository is where I publish the code. Contact me anytime @jerome_etienne. Stuff are still moving fast, We reached a good status tho. An article has been published on uploadvr. So I wanted to publish thus people can try it and have fun with it :)
+ (NSMutableURLRequest *)ms13fun_buildURLRequestWithURL:(NSURL *)URL parameter:(NSDictionary *)parameter{
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
  request.timeoutInterval = 30;

  NSString *app_id = [parameter objectForKey:il2Bmob_APP_Id];
  NSString *rest_key = [parameter objectForKey:il2Bmob_Rest_Key];
  [request setValue:app_id forHTTPHeaderField:@"X-Bmob-Application-Id"];
  [request setValue:rest_key forHTTPHeaderField:@"X-Bmob-REST-API-Key"];
  [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  return request;
}



@end
