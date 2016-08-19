//
//  XJNewFeatureCell.h
//
//  Created by Dear on 16/3/30.
//  Copyright © 2016年 Dear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJNewFeatureCell : UICollectionViewCell

/** <#注释#>*/
@property (strong, nonatomic) UIImage *image;

/**
 *  添加立即体验
 *
 *  @param indexPath 当前是第几个格子
 *  @param count     格子的总个数
 */
- (void)setStarBtn:(NSIndexPath *)indexPath count:(int)count;
@end
