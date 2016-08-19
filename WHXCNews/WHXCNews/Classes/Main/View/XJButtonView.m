//
//  XJButtonView.m
//  WHXCNews
//
//  Created by Dear on 16/7/7.
//  Copyright © 2016年 bear_fighting. All rights reserved.
//

#import "XJButtonView.h"

@implementation XJButtonView

// 快速创建
+ (instancetype)initWithView{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"XJButtonView" owner:nil options:nil];
    
    return [array lastObject];
}

@end
