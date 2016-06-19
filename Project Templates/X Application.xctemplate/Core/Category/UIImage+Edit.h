//
//  UIImage+Edit.h
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Edit)
// 图片缩放
- (UIImage *)imageScaledToSize:(CGSize)newSize aspectRatio:(BOOL)aspectRatio;

// 重设图片颜色
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

// 图片裁剪
-(UIImage *)subImageAtRect:(CGRect)rect;

// 生成圆角图片
- (UIImage *)toRoundedRectImageWithSize:(CGSize)size radius:(NSInteger)radius;
@end
