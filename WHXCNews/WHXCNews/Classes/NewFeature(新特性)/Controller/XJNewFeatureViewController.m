//
//  XJNewFeatureViewController.m
//  WHXCNews
//
//  Created by Dear on 16/7/5.
//  Copyright © 2016年 bear_fighting. All rights reserved.
//

#import "XJNewFeatureViewController.h"
#import "XJNewFeatureCell.h"

#define XJItemCount 3

@interface XJNewFeatureViewController ()
/** <#注释#>*/
@property (weak, nonatomic) UIImageView *guide;

/** 保存上一次的偏移量*/
@property (assign, nonatomic) CGFloat preOffsetX;
@end

@implementation XJNewFeatureViewController

// 重写init
- (instancetype)init{
    
    // 1.UICollectionView创建时必须得要指定布局方式
    UICollectionViewFlowLayout *flay = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置每一个格子的大小
    flay.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    
    // 设置最小的行间距
    flay.minimumLineSpacing = 0;
    // 设置每个格子之间的距离
    flay.minimumInteritemSpacing = 0;
    
    // 设置滚动的方向
    flay.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:flay];
}


static NSString * const reuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UICollectionViewCell必须得要通过注册的方式进行创建
    [self.collectionView registerClass:[XJNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // 开启分页功能
    self.collectionView.pagingEnabled = YES;
    // 关闭弹簧效果
    self.collectionView.bounces = NO;

}


#pragma mark <UICollectionViewDataSource>

// 总共有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// 每一组有多少个格子(item)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return XJItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 2.UICollectionViewCell必须得要通过注册的方式进行创建
    XJNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 拼接图片名称
    NSString *imageName = [NSString stringWithFormat:@"1136%ld",indexPath.item + 1];
    // 加载图片
    cell.image = [UIImage imageNamed:imageName];
    cell.backgroundColor = [UIColor greenColor];
    
    [cell setStarBtn:indexPath count:XJItemCount];
    return cell;
}
@end
