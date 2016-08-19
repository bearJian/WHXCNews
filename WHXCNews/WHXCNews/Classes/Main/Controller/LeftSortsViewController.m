//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "otherViewController.h"
#import "XJNewsViewController.h"
#import "XJLeftSortsCell.h"
#import "XJButtonView.h"
#import "XJSettingViewController.h"
#define LeftSortH 68
static NSString *Identifier = @"Identifier";
@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
/**<#注释#>*/
@property (nonatomic, weak) UIView *clickButtonView;
@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航条背景颜色
//    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
    
    // 初始化界面
    [self setBg];
    
    // 注册
    [self.tableview registerNib:[UINib nibWithNibName:@"XJLeftSortsCell" bundle:nil] forCellReuseIdentifier:Identifier];
}

-(void)setBg{
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"newbg"];
    [self.view addSubview:imageview];
    
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    XJButtonView *buttonView = [XJButtonView initWithView];
    buttonView.xj_y = [UIScreen mainScreen].bounds.size.height - LeftSortH;
    buttonView.backgroundColor = [UIColor clearColor];
//    _clickButtonView = buttonView.clickView;
    [self.view addSubview:buttonView];
    
    // 创建点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    tap.delegate = self;
    //添加手势
    [buttonView.clickView addGestureRecognizer:tap];
    
    
}

- (void)tap{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"XJSettingViewController" bundle:nil];
    XJSettingViewController *settingVC = [sb instantiateInitialViewController];
    [self presentViewController:settingVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJLeftSortsCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];

//    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.row == 0) {
        cell.iconV.image = [UIImage imageNamed:@"menu"];
        cell.titleL.text = @"新闻";

    } else if (indexPath.row == 1) {
        cell.iconV.image = [UIImage imageNamed:@"menu"];
        cell.titleL.text = @"图片";
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    XJNewsViewController *vc = [[XJNewsViewController alloc] init];
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    
    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return LeftSortH;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
@end
