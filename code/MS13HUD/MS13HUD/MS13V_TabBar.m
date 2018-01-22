//
//  MS13V_TabBar.m
//  MS13HUD
//
//  Created by GaviniMacBook on 2017/12/5.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MS13V_TabBar.h"
#import "MS13V_Loggers.h"

@implementation MS13V_TabBar

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"vestimage" ofType:@"bundle"];
    il2Log(@"vestimage path: %@",bundlePath);
    [self makeUI];
  }
  return self;
}

-(void)makeUI
{
// Multi-markers are an interesting way of displaying Augmented Reality. They increase tracking performance and enhance the stability of the 3d. There are many advantages of using multi-markers. In this post, we will go through the basic concept, and a step by step to try it yourself. It has a sweet workflow.
  float width= self.frame.size.width;
  UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, self.frame.size.height)];
  view.backgroundColor = [UIColor whiteColor];
  [self addSubview:view];
  

  
  NSArray *array = @[@"首页",@"后退",@"前进",@"刷新",@"退出"];
  for (int i = 0; i < 5; i++) {
    UIButton *item;
    item = [UIButton buttonWithType:UIButtonTypeCustom];
    item.frame = CGRectMake(width/5.0*i, 0, width/5.0, 40);
    item.tag = i+50;
    
    switch (i) {
       case 0: self.Shouye  = item; break;
       case 1: self.Houtui  = item; break;
       case 2: self.Qianjin = item; break;
       case 3: self.Shuaxin = item; break;
       case 4: self.Tuichu  = item; break;
      default:
      break;
    }
    [view addSubview:item];
    
    // Multi-markers are an interesting way of displaying Augmented Reality. They increase tracking performance and enhance the stability of the 3d. There are many advantages of using multi-markers. In this post, we will go through the basic concept, and a step by step to try it yourself. It has a sweet workflow.
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(width/5.0*i+(width/5.0-30)/2.0, 3, 30, 30)];
    imageview.image = [self GetBundleImage:[NSString stringWithFormat:@"0_%d",i+1]];
    imageview.userInteractionEnabled = NO;
    [view addSubview:imageview];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(width/5.0*i, 33, width/5.0, 15)];
    lable.text = array[i];
    lable.textColor = [UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:14.0];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.userInteractionEnabled = NO;
    [view addSubview:lable];
  }
}

- (UIImage *)GetBundleImage:(NSString *)imageName{
// Multi-markers are an interesting way of displaying Augmented Reality. They increase tracking performance and enhance the stability of the 3d. There are many advantages of using multi-markers. In this post, we will go through the basic concept, and a step by step to try it yourself. It has a sweet workflow.
  NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"vestimage" ofType:@"bundle"];
  return [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:imageName]];
}


@end
