//
//  VerLoadingView.m
//  XFrameworkPackaging
//
//  Created by hjpraul on 15/5/25.
//  Copyright (c) 2015年 hjpraul. All rights reserved.
//

#import "VerLoadingView.h"
#define TAG_LOADINGVIEW     191918
#define FONT_MESSAGE        [UIFont systemFontOfSize:15]
#define SIZE_ICON           37  // UIActivityIndicatorViewStyleWhiteLarge的标准大小
#define HV_SPACE            12
// 加载状态(1:加载中、2加载成功、3加载失败)
typedef NS_ENUM(NSInteger, LoadingType) {
    kLoadingTypeLoading = 1,
    kLoadingTypeSuccess = 2,
    kLoadingTypeFailed = 3,
};

@interface VerLoadingView ()
@property (retain, nonatomic) UIView *contentView;
@property (retain, nonatomic) UIImageView *bgImageView;
@property (retain, nonatomic) UIActivityIndicatorView *activity;
@property (retain, nonatomic) UIImageView *statusImageView;
@property (retain, nonatomic) UILabel *messageLabel;
@property (assign, nonatomic) LoadingType loadingType;
@end

@implementation VerLoadingView

- (id)init{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //容器
        CGRect contentFrame = CGRectMake(0, 0, frame.size.width-HV_SPACE*2, 2*HV_SPACE+SIZE_ICON);
        _contentView = [[UIView alloc] initWithFrame:contentFrame];
        [self addSubview:_contentView];
        
        //背景图片
        CGRect bgFrame = _contentView.bounds;
        _bgImageView = [[UIImageView alloc] initWithFrame:bgFrame];
        _bgImageView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75];
        [_bgImageView setCornerRadius:6.0];
        [_contentView addSubview:_bgImageView];
        
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
        [_activity startAnimating];
        _activity.hidden = YES;
        [_statusImageView addSubview:_activity];
        
        //提示信息
        CGRect messageFrame = CGRectMake(contentFrame.origin.x+HV_SPACE,
                                         contentFrame.origin.y+HV_SPACE*2+SIZE_ICON,
                                         contentFrame.size.width-HV_SPACE*2,
                                         20);
        _messageLabel = [[UILabel alloc] initWithFrame:messageFrame];
        [_messageLabel setBackgroundColor:[UIColor clearColor]];
        [_messageLabel setTextAlignment:NSTextAlignmentCenter];
        [_messageLabel setTextColor:[UIColor whiteColor]];
        _messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [_messageLabel setNumberOfLines:0];
        [_messageLabel setFont:FONT_MESSAGE];
        [_contentView addSubview:_messageLabel];
    }
    return self;
}

- (void)layoutSubviews{
    
    CGRect bgFrame = _contentView.bounds;
    [_bgImageView setFrame:bgFrame];
    
    CGRect statusFrame = CGRectMake(bgFrame.origin.x+(bgFrame.size.width-SIZE_ICON)/2,
                                    bgFrame.origin.y+HV_SPACE,
                                    SIZE_ICON,
                                    SIZE_ICON);
    [_statusImageView setFrame:statusFrame];
    _activity.frame = _statusImageView.bounds;
    
    CGRect messageFrame = CGRectMake(bgFrame.origin.x+HV_SPACE,
                                     statusFrame.origin.y+statusFrame.size.height,//+HV_SPACE,
                                     bgFrame.size.width-HV_SPACE*2,
                                     bgFrame.size.height-(bgFrame.origin.y+HV_SPACE*2+SIZE_ICON));
    [_messageLabel setFrame:messageFrame];
}

/**********************************************************************/
#pragma mark - Private Methods
/**********************************************************************/

+ (instancetype)loadingViewInView:(UIView *)view{
    VerLoadingView *loadingView = (VerLoadingView *)[view viewWithTag:TAG_LOADINGVIEW];
    if (!loadingView) {
        loadingView = [[VerLoadingView alloc] init];
        loadingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2f];
        [loadingView setTag:TAG_LOADINGVIEW];
        [loadingView setFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)];
        [view addSubview:loadingView];
    }
    return loadingView;
}

+ (CGSize)contentSizeOfMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [message sizeWithFont:FONT_MESSAGE
                             constrainedToSize:CGSizeMake(view.width-HV_SPACE*2-SIZE_ICON-HV_SPACE*2, MAXFLOAT)
                                 lineBreakMode:NSLineBreakByCharWrapping];
    contentSize.width = contentSize.width < SIZE_ICON ? HV_SPACE*2+SIZE_ICON : contentSize.width+HV_SPACE*2;
    if (message.length > 0) {
        contentSize.height = contentSize.height+HV_SPACE*2+SIZE_ICON;
    } else {
        contentSize.height = HV_SPACE*2+SIZE_ICON;
    }
    return contentSize;
}

/**********************************************************************/
#pragma mark - Puboic Methods
/**********************************************************************/

+ (void)showLoadingMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    
    //设置内容
    VerLoadingView *loadingView = [self loadingViewInView:view];
    [loadingView.messageLabel setText:message];
    [loadingView.contentView setFrame:CGRectMake((view.width-contentSize.width)/2,
                                                 (view.height-contentSize.height)/2,
                                                 contentSize.width,
                                                 contentSize.height)];
    if (loadingView.loadingType != kLoadingTypeLoading) {
        [loadingView setLoadingType:kLoadingTypeLoading];
        [loadingView.statusImageView setImage:nil];
        loadingView.activity.hidden = NO;
    }
}
+ (void)showSuccessMessage:(NSString *)message inView:(UIView *)view{
    //设置内容
    VerLoadingView *loadingView = [self loadingViewInView:view];
    if (loadingView.loadingType != kLoadingTypeLoading) {
        [loadingView removeFromSuperview];
        return;
    }
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    [loadingView.messageLabel setText:message];
    [loadingView.contentView setFrame:CGRectMake((view.width-contentSize.width)/2,
                                                 (view.height-contentSize.height)/2,
                                                 contentSize.width,
                                                 contentSize.height)];
    if (loadingView.loadingType != kLoadingTypeSuccess) {
        [loadingView setLoadingType:kLoadingTypeSuccess];
        [loadingView.statusImageView setImage:[UIImage imageNamed:@"loading_success"]];
        loadingView.activity.hidden = YES;
    }
    
    //延迟隐藏
    [UIView animateWithDuration:0.3 delay:2.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [loadingView setAlpha:0];
    } completion:^(BOOL finished) {
        [loadingView removeFromSuperview];
    }];
}
+ (void)showFailedMessage:(NSString *)message inView:(UIView *)view{
    //设置内容
    VerLoadingView *loadingView = [self loadingViewInView:view];
    if (loadingView.loadingType != kLoadingTypeLoading) {
        [loadingView removeFromSuperview];
        return;
    }
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    [loadingView.messageLabel setText:message];
    [loadingView.contentView setFrame:CGRectMake((view.width-contentSize.width)/2,
                                                 (view.height-contentSize.height)/2,
                                                 contentSize.width,
                                                 contentSize.height)];
    if (loadingView.loadingType != kLoadingTypeFailed) {
        [loadingView setLoadingType:kLoadingTypeFailed];
        [loadingView.statusImageView setImage:[UIImage imageNamed:@"loading_error"]];
        loadingView.activity.hidden = YES;
    }
    
    //延迟隐藏
    [UIView animateWithDuration:0.3 delay:2.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [loadingView setAlpha:0];
    } completion:^(BOOL finished) {
        [loadingView removeFromSuperview];
    }];
}


+ (void)hideInView:(UIView *)view animated:(BOOL)animated{
    VerLoadingView *loadingView = (VerLoadingView *)[view viewWithTag:TAG_LOADINGVIEW];
    if (!loadingView) {
        return;
    }
    
    //隐藏动画
    if (animated) {
        [UIView animateWithDuration:0.3 delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [loadingView setAlpha:0];
        } completion:^(BOOL finished) {
            [loadingView removeFromSuperview];
        }];
    } else {
        [loadingView removeFromSuperview];
    }
}

@end
