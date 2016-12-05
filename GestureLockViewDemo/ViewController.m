//
//  ViewController.m
//  GestureLockViewDemo
//
//  Created by 郭妙友 on 16/8/8.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "ViewController.h"
#import "GMYGestureLockView.h"

@interface ViewController ()<GMYGestureLockDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    CGFloat viewWitdth = [UIScreen mainScreen].bounds.size.width;
    GMYGestureLockView *lockView = [[GMYGestureLockView alloc] initWithFrame:CGRectMake((viewWitdth - 320)/2, 200, 320, 320)
                                                              lockNodeNumber:18
                                                             nodeNormalColor:[UIColor grayColor]
                                                           nodeSelectedColor:[UIColor redColor]];
    
    lockView.delegate = self;
    
    [self.view addSubview:lockView];
}

- (void)userGestureDrawedLockValue:(NSArray<NSNumber *> *)lockVals{
    [lockVals enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%lu",[obj unsignedIntegerValue]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
