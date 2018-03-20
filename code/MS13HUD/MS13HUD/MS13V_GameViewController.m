//
//  MS13V_GameViewController.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_GameViewController.h"
#import "Masonry.h"


@interface MS13V_GameViewController () <
 UIWebViewDelegate
>

@end

@implementation MS13V_GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:NO];
  
  // There are two modes in this workflow: the player and the learner.
  // The player is the one using the multi-marker to display an augmented reality experience on top of it. Obviously before this, you need to learn the //   // area where all your markers are placed.
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    webView.scrollView.bounces = NO;
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
  
      // There are two modes in this workflow: the player and the learner.
  // The player is the one using the multi-marker to display an augmented reality experience on top of it. Obviously before this, you need to learn the //   // area where all your markers are placed.
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    webView.delegate = self;
    [webView loadHTMLString:htmlCont baseURL:baseURL];
    [self.view addSubview:webView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Unity Interface GUID
// Ensures global uniqueness.
//
// Template specialization is used to produce a means of looking up a GUID from its interface type at compile time.
// The net result should compile down to passing around the GUID.
//
// UNITY_REGISTER_INTERFACE_GUID should be placed in the header file of any interface definition outside of all namespaces.
// The interface structure and the registration GUID are all that is required to expose the interface to other systems.
+ (UINavigationController *)ms13fun_windowRootViewController{
 return [[UINavigationController alloc]initWithRootViewController: [MS13V_GameViewController new]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
