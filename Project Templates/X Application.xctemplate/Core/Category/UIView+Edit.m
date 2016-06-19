//
//  UIView+Edit.m
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "UIView+Edit.h"

@implementation UIView (Edit)

- (void)setCornerRadius:(CGFloat)radius
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor {
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
    [self.layer setBorderWidth:borderWidth];
    [self.layer setBorderColor:[borderColor CGColor]];
}

- (void)setCornerRadius:(CGFloat)radius {
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
}
@end
