//
//  ViewController.m
//  GestureLockViewDemo
//
//  Created by 郭妙友 on 16/8/8.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "ViewController.h"
#import "GMYGestureLockView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    self.view.backgroundColor = [UIColor whiteColor];

    CGFloat viewWitdth = [UIScreen mainScreen].bounds.size.width;
    GMYGestureLockView *lockView = [[GMYGestureLockView alloc] initWithFrame:CGRectMake((viewWitdth - 320)/2, 200, 320, 320)];
    [self.view addSubview:lockView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
