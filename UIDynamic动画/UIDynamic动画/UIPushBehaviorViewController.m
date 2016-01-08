//
//  UIPushBehaviorViewController.m
//  UIDynamic动画
//
//  Created by hao on 16/1/8.
//  Copyright © 2016年 周豪. All rights reserved.
//

#import "UIPushBehaviorViewController.h"
#import "UIView+Extension.h"
@interface UIPushBehaviorViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBeahvior;
@property (nonatomic, strong) UIDynamicItemBehavior *itemBehavior;
@property(nonatomic,strong)UIButton *btn;
@end

@implementation UIPushBehaviorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 200, 80)];
    lable.text = @"请点击屏幕";
    [self.view addSubview:lable];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(20,20,100,20)];
    [btn1 setTitle:@"返回" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    self.view.backgroundColor = [UIColor brownColor];
    UIButton *btn = [[UIButton alloc]init];
    self.btn = btn;
    self.btn.width = 50;
    self.btn.height = 50;
    self.btn.x = 100;
    self.btn.y = 100;
    self.btn.layer.cornerRadius = self.btn.width / 2;
    
    self.btn.clipsToBounds = YES;
    self.btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.btn];
    
    // Set up
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:nil];
    
    [self.animator addBehavior:self.gravityBeahvior];
    [self.animator addBehavior:self.itemBehavior];
}
-(void)click
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.gravityBeahvior addItem:self.btn];
}

@end
