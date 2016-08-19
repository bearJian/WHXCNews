//
//  XJSettingViewController.m
//  WHXCNews
//
//  Created by Dear on 16/7/7.
//  Copyright © 2016年 bear_fighting. All rights reserved.
//

#import "XJSettingViewController.h"

@interface XJSettingViewController ()

@end

@implementation XJSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    // 设置导航条文字
    self.title = @"设置";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtn:(id)sender {
    // 返回到LeftSortsViewController
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
