//
//  UIAttachmentBehaviorViewController.m
//  UIDynamic动画
//
//  Created by hao on 16/1/8.
//  Copyright © 2016年 周豪. All rights reserved.
//

#import "UIAttachmentBehaviorViewController.h"
#import "UIView+Extension.h"
@interface UIAttachmentBehaviorViewController ()
{
    UIPushBehavior *_userDragBehavior;
}
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBeahvior;
@property (nonatomic, strong) UIDynamicItemBehavior *itemBehavior;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;

@property(nonatomic,strong)UIButton *btn;
@end

@implementation UIAttachmentBehaviorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 200, 80)];
    lable.text = @"请点击屏幕";
    [self.view addSubview:lable];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(20,20,100,20)];
    [btn1 setTitle:@"返回" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(200,200,20,20)];
    
    btn2.backgroundColor = [UIColor redColor];

    [self.view addSubview:btn2];
    
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
    
    UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(doHandlePanAction:)];
    [self.btn addGestureRecognizer:panGestureRecognizer];
    
    // Set up
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:nil];
    
   //附着行为
    self.attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.btn attachedToAnchor:CGPointMake(200, 200)];
    
    [self.animator addBehavior:self.attachmentBehavior];
//    [self.animator addBehavior:self.gravityBeahvior];
    [self.animator addBehavior:self.itemBehavior];
}
- (void) doHandlePanAction:(UIPanGestureRecognizer *)recoginizer{
    
    //用户开始拖动时创建一个新的UIPushBehavior,并添加到animator中
    if(recoginizer.state == UIGestureRecognizerStateBegan){
        if (_userDragBehavior) {
            [_animator removeBehavior:_userDragBehavior];
        }
        _userDragBehavior = [[UIPushBehavior alloc] initWithItems:@[recoginizer.view] mode:UIPushBehaviorModeContinuous];
        [_animator addBehavior:_userDragBehavior];
    }
    
    //用户完成拖动时，从animator移除PushBehavior
    _userDragBehavior.pushDirection = CGVectorMake([recoginizer translationInView:self.view].x/10, 0);
    if (recoginizer.state == UIGestureRecognizerStateEnded) {
        
        [_animator removeBehavior:_userDragBehavior];
        _userDragBehavior = nil;
    }
}
-(void)click
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.gravityBeahvior addItem:self.btn];
}

@end
