//
//  UIBarButtonItem+Item.h
//  WHXCNews
//
//  Created by Dear on 16/7/5.
//  Copyright © 2016年 bear_fighting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (UIBarButtonItem *)item:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)item:(UIImage *)image hightImage:(UIImage *)hightImage target:(id)target action:(SEL)action;
@end
