//
//  CommonLine.m
//  SchoolPalmUser
//
//  Created by zhax001 on 14-9-4.
//  Copyright (c) 2014年 hjpraul. All rights reserved.
//

#import "CommonLine.h"

@implementation CommonLine

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self performSelector:@selector(initView) withObject:nil afterDelay:0];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self performSelector:@selector(initView) withObject:nil afterDelay:0];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initView];
}

- (void)initView{
    if (self.width<=1) {
        self.image = [[UIImage imageNamed:@"fg_line_ver"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
        self.highlightedImage = [[UIImage imageNamed:@"fg_line_ver"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    } else {
        self.image = [[UIImage imageNamed:@"fg_line_her"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
        self.highlightedImage = [[UIImage imageNamed:@"fg_line_her"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
