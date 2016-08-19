//
//  MainPageViewController.m
//  LeftSlide
//
//  Created by huangzhenyu on 15/6/18.
//  Copyright (c) 2015年 eamon. All rights reserved.
//

#import "MainPageViewController.h"
#import "AppDelegate.h"
#import "otherViewController.h"
static NSString * const ID = @"cell";
@interface MainPageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/**<#注释#>*/
@property (nonatomic, weak) UICollectionView *collection;
/**<#注释#>*/
@property (nonatomic, weak) UIScrollView *topView;
/**<#注释#>*/
@property (nonatomic, strong) NSMutableArray *titleBtn;
/**<#注释#>*/
@property (nonatomic, weak) UIButton *preselectBtn;
/**<#注释#>*/
@property (nonatomic, weak) UIView *lineView;
/**<#注释#>*/
@property (nonatomic, assign) BOOL isTitle;
@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    [self setupNavgationBar];
    
    // 添加所有的子控制器
    [self setupAllChildViewController];
    
    // 搭建底部view
    [self setupBottomView];
    // 搭建顶部view
    [self setuptopView];
    
    // iOS7之后，如果是导航控制器下scrollView,顶部都会添加64的额外滚动区域
//    self.automaticallyAdjustsScrollViewInsets = NO;

}

// 搭建底部view
- (void)setupBottomView{
    
    // 布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(XJScreenW, XJScreenH);
    
    // 创建UICollectionView
    UICollectionView * collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collection.scrollsToTop = NO;
    _collection = collection;
    collection.dataSource =self;
    collection.pagingEnabled = YES;
    collection.delegate = self;
    collection.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collection];
    
    // 注册
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.childViewControllers.count;;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 把对应子控制器的view添加到对应的cell的contentView
    UIViewController *vc = self.childViewControllers[indexPath.row];
    
    vc.view.frame = CGRectMake(0, 0, XJScreenW, XJScreenH);
    [cell.contentView addSubview:vc.view];
    
    cell.backgroundColor = XJColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255));
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger i = scrollView.contentOffset.x / XJScreenW;
    [self selButton:self.titleBtn[i]];
    
}


// 添加所有的子控制器
- (void)setupAllChildViewController
{
    // 头条
    UIViewController *allVc = [[UIViewController alloc] init];
    allVc.title = @"头条";
    [self addChildViewController:allVc];
    
    // 武汉
    UIViewController *videoVc = [[UIViewController alloc] init];
    videoVc.title = @"武汉";
    [self addChildViewController:videoVc];
    // 24小时
    UIViewController *voiceVc = [[UIViewController alloc] init];
    voiceVc.title = @"24小时";
    [self addChildViewController:voiceVc];
    // 天下
    UIViewController *pictureVc = [[UIViewController alloc] init];
    pictureVc.title = @"天下";
    [self addChildViewController:pictureVc];
    // 段子
    UIViewController *textVc = [[UIViewController alloc] init];
    textVc.title = @"娱乐";
    [self addChildViewController:textVc];
    
}

// 添加所有标题

- (void)setupAllTitle{
    
    NSInteger count = self.childViewControllers.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = XJScreenW / count;
    CGFloat h = _topView.xj_height;
    
    for (int i = 0; i < count; i++) {
        x = i * w;
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(x, y, w, h);
        NSString *title = [self.childViewControllers[i] title];
        [titleBtn setTitle:title forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        // 设置字体
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        // 监听点击
        [titleBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleBtn addObject:titleBtn];
        [self.topView addSubview:titleBtn];
        if (i == 0) {
            [self selButton:titleBtn];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor redColor];
            lineView.xj_width = [title sizeWithFont:[UIFont systemFontOfSize:15]].width;
            lineView.xj_height = 2;
            lineView.xj_y = self.topView.xj_height - lineView.xj_height;
            lineView.xj_centerX = titleBtn.xj_centerX;
            
            [_topView addSubview:lineView];
            _lineView = lineView;
        }
    }
}
// 添加所有标题
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (_isTitle == NO) {
        [self setupAllTitle];
        _isTitle = YES;
    }
    
    NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}
// 点击按钮
- (void)click:(UIButton *)button{
    
    NSInteger i = button.tag;
    
    [self selButton:button];
    
    // 切换cell
    CGFloat offsetX = i * XJScreenW;
    _collection.contentOffset = CGPointMake(offsetX, 0);
    
}

// 搭建顶部view
- (void)setuptopView{
    
    UIScrollView *topView = [[UIScrollView alloc] init];
    topView.scrollsToTop = NO;
    topView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
//    CGFloat topY = self.navigationController.navigationBarHidden ? 20 : 64;
    CGFloat topW = XJScreenW;
    CGFloat topH = 44;
    topView.frame = CGRectMake(0, 0, topW, topH);
    _topView = topView;
    [self.view addSubview:topView];
    
}

// 选中按钮
- (void)selButton:(UIButton *)button{
    
    _preselectBtn.selected = NO;
    button.selected = YES;
    _preselectBtn = button;
    
    [UIView animateWithDuration:0.2 animations:^{
        _lineView.xj_centerX = button.xj_centerX;
        _lineView.xj_width = button.titleLabel.xj_width;
        //    重复设置,刷新lineview
        _lineView.xj_centerX = button.xj_centerX;
        _lineView.xj_width = button.titleLabel.xj_width;
    }];
}

#pragma mark - 设置导航条
- (void)setupNavgationBar
{
    // 左边
    UIBarButtonItem *itemL = [UIBarButtonItem item:[UIImage imageNamed:@"menu"] hightImage:[UIImage imageNamed:@"menu"] target:self action:@selector(openOrCloseLeftList)];
    self.navigationItem.leftBarButtonItem = itemL;
    // 右边
    UIBarButtonItem *itemR = [UIBarButtonItem item:[UIImage imageNamed:@"menu"] hightImage:[UIImage imageNamed:@"menu"] target:self action:@selector(tagR)];
    self.navigationItem.rightBarButtonItem = itemR;
    
    // 设置导航条文字
    self.title = @"大武汉新闻";
}


- (void)tagR
{
    otherViewController *subTagRVc = [[otherViewController alloc] init];
    [self.navigationController pushViewController:subTagRVc animated:YES];
    
}


- (void) openOrCloseLeftList
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}


@end
