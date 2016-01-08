//
//  ViewController.m
//  UIDynamic动画
//
//  Created by hao on 16/1/8.
//  Copyright © 2016年 周豪. All rights reserved.
//

#import "ViewController.h"
#import "UIAttachmentBehaviorViewController.h"
#import "UICollisionBehaviorViewController.h"
#import "UIGravityBehaviorViewController.h"
#import "UIPushBehaviorViewController.h"
@interface ViewController ()
- (IBAction)attachmentBehavior:(id)sender;
- (IBAction)pushBehavior:(id)sender;
;
- (IBAction)collisionBehavior:(id)sender;
- (IBAction)gravityBehavior:(id)sender;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


- (IBAction)attachmentBehavior:(id)sender {
    [self presentViewController:[[UIAttachmentBehaviorViewController alloc]init] animated:YES completion:nil];
}

- (IBAction)pushBehavior:(id)sender {
        [self presentViewController:[[UIPushBehaviorViewController alloc]init] animated:YES completion:nil];
}

- (IBAction)collisionBehavior:(id)sender {
        [self presentViewController:[[UICollisionBehaviorViewController alloc]init] animated:YES completion:nil];
}

- (IBAction)gravityBehavior:(id)sender {
        [self presentViewController:[[UIGravityBehaviorViewController alloc]init] animated:YES completion:nil];
}
@end
