//
//  BGVerLoadingView.m
//  XFrameworkPackaging
//
//  Created by hjpraul on 15/4/16.
//  Copyright (c) 2015年 hjpraul. All rights reserved.
//

#import "BGVerLoadingView.h"

#define TAG_LOADINGVIEW     181817
#define FONT_MESSAGE        [UIFont systemFontOfSize:15]
#define SIZE_ICON           78//37  // UIActivityIndicatorViewStyleWhiteLarge的标准大小
#define HV_SPACE            8


@interface BGVerLoadingView ()
@property (nonatomic, retain) UIView *contentView;
@property (nonatomic, retain) UIImageView *statusImageView;
@property (retain, nonatomic) UIActivityIndicatorView *activity;
@property (nonatomic, retain) UILabel *messageLabel;
@end

@implementation BGVerLoadingView

- (id)init{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //容器
        CGRect contentFrame = CGRectMake(0, 0, frame.size.width-HV_SPACE*2, 2*HV_SPACE+SIZE_ICON);
        _contentView = [[UIView alloc] initWithFrame:contentFrame];
        [_contentView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_contentView];
        
        //状态图片
        CGRect statusFrame = CGRectMake(contentFrame.origin.x+SIZE_ICON/2,
                                        HV_SPACE,
                                        SIZE_ICON,
                                        SIZE_ICON);
        _statusImageView = [[UIImageView alloc] initWithFrame:statusFrame];
        _statusImageView.contentMode = UIViewContentModeScaleToFill;
        [_contentView addSubview:_statusImageView];
        
        // Loading状态图片
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activity.center = CGPointMake(_statusImageView.width/2, _statusImageView.height/2);
        [_activity startAnimating];
        _activity.hidden = YES;
//        [_statusImageView addSubview:_activity];  ///TODO:暂时屏蔽，有bug
        
        //提示信息
        CGRect messageFrame = CGRectMake(contentFrame.origin.x+HV_SPACE,
                                         contentFrame.origin.y+HV_SPACE*2+SIZE_ICON,
                                         contentFrame.size.width-HV_SPACE*2,
                                         20);
        _messageLabel = [[UILabel alloc] initWithFrame:messageFrame];
        [_messageLabel setBackgroundColor:[UIColor clearColor]];
        [_messageLabel setTextAlignment:NSTextAlignmentCenter];
        [_messageLabel setTextColor:[UIColor darkGrayColor]];
        _messageLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [_messageLabel setNumberOfLines:0];
        [_messageLabel setFont:FONT_MESSAGE];
        [_contentView addSubview:_messageLabel];
    }
    return self;
}

- (void)layoutSubviews{
    
    CGRect statusFrame = CGRectMake(_contentView.bounds.origin.x+(_contentView.bounds.size.width-SIZE_ICON)/2,
                                    _contentView.bounds.origin.y+HV_SPACE,
                                    SIZE_ICON,
                                    SIZE_ICON);
    [_statusImageView setFrame:statusFrame];
    
    CGRect messageFrame = CGRectMake(_contentView.bounds.origin.x+HV_SPACE,
                                     statusFrame.origin.y+statusFrame.size.height+HV_SPACE,
                                     _contentView.bounds.size.width-HV_SPACE*2,
                                     _contentView.bounds.size.height-(_contentView.bounds.origin.y+HV_SPACE*3+SIZE_ICON));
    _messageLabel.adjustsFontSizeToFitWidth = YES;  ///TODO:临时处理方法
    [_messageLabel setFrame:messageFrame];
}

/**********************************************************************/
#pragma mark - Private Methods
/**********************************************************************/
+ (CGSize)contentSizeOfMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [message sizeWithFont:FONT_MESSAGE
                             constrainedToSize:CGSizeMake(view.width-HV_SPACE*2*2, MAXFLOAT)
                                 lineBreakMode:NSLineBreakByTruncatingTail];
    contentSize.width = contentSize.width < SIZE_ICON ? HV_SPACE*2+SIZE_ICON : contentSize.width+HV_SPACE*2;
    contentSize.height = contentSize.height+HV_SPACE*3+SIZE_ICON;
    return contentSize;
}

+ (BGVerLoadingView *)loadingViewInView:(UIView *)view{
    BGVerLoadingView *loadingView = (BGVerLoadingView *)[view viewWithTag:TAG_LOADINGVIEW];
    if (!loadingView) {
        loadingView = [[BGVerLoadingView alloc] init];
        [loadingView setTag:TAG_LOADINGVIEW];
        [loadingView setFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)];
        [view addSubview:loadingView];
    }
    return loadingView;
}

/**********************************************************************/
#pragma mark - Puboic Methods
/**********************************************************************/

+ (void)showLoadingMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    
    //设置内容
    BGVerLoadingView *loadingView = [self loadingViewInView:view];
    [loadingView.messageLabel setText:message];
    [loadingView.contentView setFrame:CGRectMake((view.width-contentSize.width)/2,
                                                 (view.height-contentSize.height)/2,
                                                 contentSize.width,
                                                 contentSize.height)];
    
    [loadingView.statusImageView setImage:nil];
    loadingView.activity.hidden = NO;
}
+ (void)showFailedMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    
    //设置内容
    BGVerLoadingView *loadingView = [self loadingViewInView:view];
    [loadingView.messageLabel setText:message];
    [loadingView.contentView setFrame:CGRectMake((view.width-contentSize.width)/2,
                                                 (view.height-contentSize.height)/2,
                                                 contentSize.width,
                                                 contentSize.height)];
    [loadingView.statusImageView setImage:[UIImage imageNamed:@"bg_loading_failed"]];
    loadingView.activity.hidden = YES;
}
+ (void)showNoInfoMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    
    //设置内容
    BGVerLoadingView *loadingView = [self loadingViewInView:view];
    [loadingView.messageLabel setText:message];
    [loadingView.contentView setFrame:CGRectMake((view.width-contentSize.width)/2,
                                                 (view.height-contentSize.height)/2,
                                                 contentSize.width,
                                                 contentSize.height)];
    [loadingView.statusImageView setImage:[UIImage imageNamed:@"bg_loading_failed"]];
    loadingView.activity.hidden = YES;
}


+ (void)hideInView:(UIView *)view animated:(BOOL)animated{
    BGVerLoadingView *loadingView = (BGVerLoadingView *)[view viewWithTag:TAG_LOADINGVIEW];
    if (!loadingView) {
        return;
    }
    
    //隐藏动画
    if (animated) {
        [UIView animateWithDuration:0.2f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [loadingView setAlpha:0];
        } completion:^(BOOL finished) {
            [loadingView removeFromSuperview];
        }];
    } else {
        [loadingView removeFromSuperview];
    }
}

@end
