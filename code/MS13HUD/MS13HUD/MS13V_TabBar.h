//
//  MS13V_TabBar.h
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

// Multi-markers are an interesting way of displaying Augmented Reality. They increase tracking performance and enhance the stability of the 3d. There are many advantages of using multi-markers. In this post, we will go through the basic concept, and a step by step to try it yourself. It has a sweet workflow.
@interface MS13V_TabBar : UIView

@property (strong, nonatomic) UIButton *Shouye;
@property (strong, nonatomic) UIButton *Houtui;
@property (strong, nonatomic) UIButton *Qianjin;
// The term multi-marker means using more than one marker at a time. Before, we used only one square marker e.g Hiro marker. This is nice but we can go much further. With multi-markers, we have multiple markers acting as one larger marker.
@property (strong, nonatomic) UIButton *Shuaxin;
@property (strong, nonatomic) UIButton *Tuichu;

@end
