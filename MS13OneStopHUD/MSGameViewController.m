//
//  MSGameViewController.m
//  MS13OneStopHUD
//
//  Created by GaviniMacBook on 2017/11/30.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MSGameViewController.h"

@interface MSGameViewController () <
  UIWebViewDelegate
>

@end

@implementation MSGameViewController : UIViewController

+ (UINavigationController *)windowRootViewController{
  return [[UINavigationController alloc]initWithRootViewController: [MSGameViewController new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
  
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    webView.scrollView.bounces = NO;
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    webView.delegate = self;
    [webView loadHTMLString:htmlCont baseURL:baseURL];
    [self.view addSubview:webView];
}


@end
