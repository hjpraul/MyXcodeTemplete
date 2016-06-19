//
//  UIImage+Create.h
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Create)
// 创建纯色图片
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

// 视图转图片
+ (UIImage *)imageWithView:(UIView *)view;
@end
