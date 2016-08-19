//
//  UIBarButtonItem+Item.m
//  WHXCNews
//
//  Created by Dear on 16/7/5.
//  Copyright © 2016年 bear_fighting. All rights reserved.
//
#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
+ (UIBarButtonItem *)item:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *contentV = [[UIView alloc] initWithFrame:btn.bounds];
    [contentV addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentV];
}

+ (UIBarButtonItem *)item:(UIImage *)image hightImage:(UIImage *)hightImage target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *contentV = [[UIView alloc] initWithFrame:btn.bounds];
    [contentV addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentV];
    
}
@end
