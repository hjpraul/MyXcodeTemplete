//
//  UIView+Blank.m
//  DNF
//
//  Created by Jayla on 16/2/23.
//  Copyright © 2016年 anzogame. All rights reserved.
//

#import "UIView+Blank.h"

@implementation UIView (Blank)

- (void)showBlankWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message action:(void (^)(void))action {
    __weak typeof(self) weakSelf = self;
    
    
    UIImageView *imageView = [self viewWithTag:-8709141];
    if (image) {
        if (imageView == nil) {
            imageView = [[UIImageView alloc] init];
            imageView.tag = -8709141;
            imageView.backgroundColor = [UIColor clearColor];
            imageView.contentMode = UIViewContentModeCenter;
            [self insertSubview:imageView atIndex:0];
        }
        imageView.image = image;
        
        [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf);
            make.bottom.equalTo(weakSelf.mas_centerY).offset(-20);
        }];
    } else {
        [imageView removeFromSuperview];
        imageView = nil;
    }
    
    
    UILabel *titleLabel = [self viewWithTag:-8709142];
    if (title) {
        if (titleLabel == nil) {
            titleLabel = [[UILabel alloc] init];
            titleLabel.tag = -8709142;
            titleLabel.backgroundColor = [UIColor clearColor];
            titleLabel.textColor = [UIColor lightGrayColor];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.font = [UIFont systemFontOfSize:16];
            [self insertSubview:titleLabel atIndex:0];
        }
        titleLabel.text= title;
        
        if (imageView) {
            [titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf);
                make.top.equalTo(imageView.mas_bottom).offset(20);
                make.left.lessThanOrEqualTo(weakSelf).offset(20);
            }];
        } else {
            [titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf);
                make.bottom.equalTo(weakSelf.mas_centerY);
                make.left.lessThanOrEqualTo(weakSelf).offset(20);
            }];
        }
    } else {
        [titleLabel removeFromSuperview];
        titleLabel = nil;
    }
    
    
    UILabel *messageLabel = [self viewWithTag:-8709143];
    if (message) {
        if (messageLabel == nil) {
            messageLabel = [[UILabel alloc] init];
            messageLabel.tag = -8709143;
            messageLabel.backgroundColor = [UIColor clearColor];
            messageLabel.textColor = [UIColor lightGrayColor];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.font = [UIFont systemFontOfSize:15];
            [self insertSubview:messageLabel atIndex:0];
        }
        messageLabel.text= message;
        
        if (titleLabel) {
            [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf);
                make.top.equalTo(titleLabel.mas_bottom).offset(8);
                make.left.lessThanOrEqualTo(weakSelf).offset(20);
            }];
        } else if (imageView) {
            [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf);
                make.top.equalTo(imageView.mas_bottom).offset(20);
                make.left.lessThanOrEqualTo(weakSelf).offset(20);
            }];
        } else {
            [messageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf);
                make.bottom.equalTo(weakSelf.mas_centerY);
                make.left.lessThanOrEqualTo(weakSelf).offset(20);
            }];
        }
    } else {
        [messageLabel removeFromSuperview];
        messageLabel = nil;
    }
    
    
    UIButton *button = [self viewWithTag:-8709144];
    if (action) {
        if (button == nil) {
            button = [[UIButton alloc] init];
            button.tag = -8709144;
            button.backgroundColor = [UIColor clearColor];
            button.adjustsImageWhenHighlighted = NO;
            [button addTarget:self action:@selector(__blankAction:) forControlEvents:UIControlEventTouchUpInside];
            [self insertSubview:button atIndex:0];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(weakSelf);
                make.top.left.equalTo(weakSelf);
            }];
        }
    } else {
        [button removeFromSuperview];
        button = nil;
    }
    
    objc_setAssociatedObject(self, "__blankAction__", action, OBJC_ASSOCIATION_COPY);
}

- (void)showBlankWithType:(BlankType)type title:(NSString *)title message:(NSString *)message action:(void (^)(void))action {
    UIImage *image = nil;
    switch (type) {
        case BlankType_LoadFailure:{
            image = [UIImage imageNamed:@"空白提示-加载失败"];
        }break;
        case BlankType_NoAttention:{
            image = [UIImage imageNamed:@"空白提示-未关注"];
        }break;
        case BlankType_Collect:{
            image = [UIImage imageNamed:@"空白提示-收藏"];
        }break;
        case BlankType_Comment:{
            image = [UIImage imageNamed:@"空白提示-评论"];
        }break;
        case BlankType_Topic:{
            image = [UIImage imageNamed:@"空白提示-话题"];
        }break;
        default:{
//            image = [UIImage imageNamed:@"陌生人列表空占位符"];
//            image = [UIImage imageNamed:@"视频_笑脸占位图"];
//            image = [UIImage imageNamed:@"视频_列表下载占位图"];
//            image = [UIImage imageNamed:@"视频-大"];
//            image = [UIImage imageNamed:@"视频-小"];
        }break;
    }
    [self showBlankWithImage:image title:title message:message action:action];
}

- (void)dismissBlank {
    UIImageView *imageView = [self viewWithTag:-8709141];
    [imageView removeFromSuperview];
    
    UILabel *titleLabel = [self viewWithTag:-8709142];
    [titleLabel removeFromSuperview];
    
    UILabel *messageLabel = [self viewWithTag:-8709143];
    [messageLabel removeFromSuperview];
    
    UIButton *button = [self viewWithTag:-8709144];
    [button removeFromSuperview];
    
    objc_setAssociatedObject(self, "__blankAction__", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)__blankAction:(UIButton *)sender {
    void (^action)(void) = objc_getAssociatedObject(self, "__blankAction__");
    if (action) {
        action();
    }
}

@end
