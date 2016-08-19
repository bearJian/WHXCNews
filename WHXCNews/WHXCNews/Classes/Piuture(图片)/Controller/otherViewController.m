//
//  otherViewController.m
//  LGDeckViewController
//
//  Created by huangzhenyu on 15/6/1.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "otherViewController.h"

@interface otherViewController ()
/**<#注释#>*/
@property (nonatomic, strong) UIView *contView;
@end

@implementation otherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置随机背景
    self.view.backgroundColor = XJColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255));
    
    // 隐藏导航条
    self.navigationController.navigationBarHidden = YES;
    
    //添加子控件
    _contView = [[UIView alloc] initWithFrame:self.view.bounds];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
