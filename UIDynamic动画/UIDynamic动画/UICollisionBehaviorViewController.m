//
//  UICollisionBehaviorViewController.m
//  UIDynamic动画
//
//  Created by hao on 16/1/8.
//  Copyright © 2016年 周豪. All rights reserved.
//

#import "UICollisionBehaviorViewController.h"

#import "UIView+Extension.h"
@interface UICollisionBehaviorViewController ()<UICollisionBehaviorDelegate>
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBeahvior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) UIDynamicItemBehavior *itemBehavior;

@property(nonatomic,strong)UIButton *btn;
@end

@implementation UICollisionBehaviorViewController

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
    
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:nil];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    // 物体的碰撞模式共有三种：UICollisionBehaviorModeItems(物体相互碰撞)
    //    //    UICollisionBehaviorModeBoundaries(物体不相互碰撞，只与边界碰撞)
    //    //    UICollisionBehaviorModeEverything(既与物体碰撞又与边界碰撞)
    //
    [self.collisionBehavior setCollisionMode:UICollisionBehaviorModeEverything];
    self.collisionBehavior.collisionDelegate =self;
    //动力行为
    self.itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:nil];
    self.itemBehavior.elasticity = 0.9;
    self.itemBehavior.friction = 0.8;
    self.itemBehavior.resistance = 0.8;
    
    [self.animator addBehavior:self.itemBehavior];
    [self.animator addBehavior:self.gravityBeahvior];
    [self.animator addBehavior:self.collisionBehavior];
}
-(void)click
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.collisionBehavior addItem:self.btn];
    [self.gravityBeahvior addItem:self.btn];
    [self.itemBehavior addItem:self.btn];
}
-(void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id)identifier atPoint:(CGPoint)p
{
    NSLog(@"开始碰撞时触发的方法");
}
-(void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id)identifier
{
    NSLog(@"结束碰撞时触发的方法");
}

@end
