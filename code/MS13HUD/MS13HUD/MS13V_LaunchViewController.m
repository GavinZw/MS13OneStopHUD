//
//  MS13V_LaunchViewController.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/6.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_LaunchViewController.h"
#import "MS13V_Configure.h"

@interface MS13V_LaunchViewController ()

@end

@implementation MS13V_LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *launchImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[MS13V_Configure shared].launchImage]];
    launchImage.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:launchImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
