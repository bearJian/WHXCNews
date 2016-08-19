//
//  UIImage+Image.m
//  WHXCNews
//
//  Created by Dear on 16/7/5.
//  Copyright © 2016年 bear_fighting. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
/**注释*/
+(UIImage *)imageWithRenderImageNamed:(NSString *)image{
    
    UIImage *img = [UIImage imageNamed:image];
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
