//
//  XJNewFeatureCell.m
//
//  Created by Dear on 16/3/30.
//  Copyright © 2016年 Dear. All rights reserved.
//

#import "XJNewFeatureCell.h"
#import "LeftSortsViewController.h"
#import "MainPageViewController.h"
#import "AppDelegate.h"
@interface XJNewFeatureCell()

/** <#注释#>*/
@property (weak, nonatomic) UIImageView *imageV;

/** <#注释#>*/
@property (weak, nonatomic) UIButton *startBtn;
@end

@implementation XJNewFeatureCell

- (UIImageView *)imageV{
    
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = self.bounds;
        [self.contentView addSubview:imageV];
        _imageV = imageV;
    }
    return _imageV;
}

/**************************设置立即体验按钮************************/
- (UIButton *)startBtn{
    
    if (_startBtn == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 自适应大小
        [btn sizeToFit];
        // 设置位置
        btn.xj_width = 130;
        btn.center = CGPointMake(self.xj_width * 0.5, self.xj_height * 0.855 );
        [self.contentView addSubview:btn];
        _startBtn = btn;
        
        // 监听按钮点击事件
        [btn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

/**************************立即体验按钮的点击(切换到主框架)************************/
- (void)startBtnClick{
    
    // 切换程序的主框架
    // 切换窗口的根控制器
    MainPageViewController *mainVC = [[MainPageViewController alloc] init];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    tempAppDelegate.mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    LeftSortsViewController *leftVC = [[LeftSortsViewController alloc] init];
    tempAppDelegate.LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tempAppDelegate.mainNavigationController];
    [UIApplication sharedApplication].keyWindow.rootViewController = tempAppDelegate.LeftSlideVC;
}


- (void)setImage:(UIImage *)image{
    
    _image = image;
    self.imageV.image = image;
}
/**
 *  添加立即体验
 *
 *  @param indexPath 当前是第几个格子
 *  @param count     格子的总个数
 */
- (void)setStarBtn:(NSIndexPath *)indexPath count:(int)count{
    
    if (indexPath.item == count - 1) {
        self.startBtn.hidden = NO;
    }else{
        // 隐藏按钮
        self.startBtn.hidden = YES;
    }
}

@end
