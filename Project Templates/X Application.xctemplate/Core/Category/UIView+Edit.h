//
//  UIView+Edit.h
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Edit)
- (void)setCornerRadius:(CGFloat)radius
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor;

- (void)setCornerRadius:(CGFloat)radius;
@end
