//
//  HerLoadingView.m
//  XFrameworkPackaging
//
//  Created by hjpraul on 15/4/16.
//  Copyright (c) 2015年 hjpraul. All rights reserved.
//

#import "HerLoadingView.h"

#define TAG_LOADINGVIEW     191919
#define FONT_MESSAGE        [UIFont systemFontOfSize:15]
#define SIZE_ICON           20
#define SIZE_HEIGHT         40
#define SPACE_TO_CONTAINER  16
#define HV_SPACE            ((SIZE_HEIGHT-SIZE_ICON)/2)

// 加载状态(1:加载中、2加载成功、3加载失败)
typedef NS_ENUM(NSInteger, LoadingType) {
    kLoadingTypeLoading = 1,
    kLoadingTypeSuccess = 2,
    kLoadingTypeFailed = 3,
};

@interface HerLoadingView ()
@property (retain, nonatomic) UIView *contentView;
@property (retain, nonatomic) UIImageView *bgImageView;
@property (retain, nonatomic) UIActivityIndicatorView *activity;
@property (retain, nonatomic) UIImageView *statusImageView;
@property (retain, nonatomic) UILabel *messageLabel;
@property (assign, nonatomic) LoadingType loadingType;
@end

@implementation HerLoadingView

- (id)init{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //容器
        CGRect contentFrame = CGRectMake(0, 0, frame.size.width-SPACE_TO_CONTAINER*2, SIZE_HEIGHT);
        _contentView = [[UIView alloc] initWithFrame:contentFrame];
        [self addSubview:_contentView];
        
        //背景图片
        CGRect bgFrame = _contentView.bounds;
        _bgImageView = [[UIImageView alloc] initWithFrame:bgFrame];
        _bgImageView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75];
        [_bgImageView setCornerRadius:6.0];
        [_contentView addSubview:_bgImageView];
        
        //状态图片
        CGRect statusFrame = CGRectMake(HV_SPACE+bgFrame.origin.x,
                                        HV_SPACE,
                                        SIZE_ICON,
                                        contentFrame.size.height-HV_SPACE*2);
        _statusImageView = [[UIImageView alloc] initWithFrame:statusFrame];
        [_statusImageView setContentMode:UIViewContentModeScaleAspectFit];
        [_contentView addSubview:_statusImageView];
        
        // Loading状态图片
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [_activity startAnimating];
        _activity.hidden = YES;
        [_statusImageView addSubview:_activity];
        
        //提示信息
        CGRect messageFrame = CGRectMake(SIZE_ICON+20,
                                         10,
                                         contentFrame.size.width-(SIZE_ICON+30),
                                         contentFrame.size.height-20);
        _messageLabel = [[UILabel alloc] initWithFrame:messageFrame];
        [_messageLabel setBackgroundColor:[UIColor clearColor]];
        [_messageLabel setTextAlignment:NSTextAlignmentCenter];
        [_messageLabel setTextColor:[UIColor whiteColor]];
        [_messageLabel setNumberOfLines:0];
        [_messageLabel setFont:FONT_MESSAGE];
        [_contentView addSubview:_messageLabel];
    }
    return self;
}

- (void)layoutSubviews{
    
    CGRect bgFrame = _contentView.bounds;
    [_bgImageView setFrame:bgFrame];
    
    CGRect statusFrame = CGRectMake(HV_SPACE+bgFrame.origin.x,
                                    HV_SPACE,
                                    SIZE_ICON,
                                    _contentView.bounds.size.height-HV_SPACE*2);
    [_statusImageView setFrame:statusFrame];
    _activity.frame = _statusImageView.bounds;
    
    CGRect messageFrame = CGRectMake(statusFrame.origin.x+SIZE_ICON+HV_SPACE,
                                     HV_SPACE,
                                     _contentView.bounds.size.width-(SIZE_ICON+HV_SPACE*3),
                                     _contentView.bounds.size.height-HV_SPACE*2);
    [_messageLabel setFrame:messageFrame];
}

/**********************************************************************/
#pragma mark - Private Methods
/**********************************************************************/

+ (instancetype)loadingViewInView:(UIView *)view{
    HerLoadingView *loadingView = (HerLoadingView *)[view viewWithTag:TAG_LOADINGVIEW];
    if (!loadingView) {
        loadingView = [[HerLoadingView alloc] init];
        loadingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2f];
        [loadingView setTag:TAG_LOADINGVIEW];
        [loadingView setFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)];
        [view addSubview:loadingView];
    }
    return loadingView;
}

+ (CGSize)contentSizeOfMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [message sizeWithFont:FONT_MESSAGE
                             constrainedToSize:CGSizeMake(view.width-SPACE_TO_CONTAINER*2-SIZE_ICON-HV_SPACE*3, FONT_MESSAGE.pointSize)
                                 lineBreakMode:NSLineBreakByWordWrapping];
    contentSize.width = contentSize.width+SIZE_ICON+HV_SPACE*3;
    contentSize.height = (contentSize.height<(SIZE_HEIGHT-HV_SPACE*2)?(SIZE_HEIGHT-HV_SPACE*2):contentSize.height)+HV_SPACE*2;
    return contentSize;
}

/**********************************************************************/
#pragma mark - Puboic Methods
/**********************************************************************/

+ (void)showLoadingMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    
    //设置内容
    HerLoadingView *loadingView = [self loadingViewInView:view];
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
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    
    //设置内容
    HerLoadingView *loadingView = [self loadingViewInView:view];
    if (loadingView.loadingType != kLoadingTypeLoading) {
        [loadingView removeFromSuperview];
        return;
    }
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
    [UIView animateWithDuration:0.3f delay:2.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [loadingView setAlpha:0];
    } completion:^(BOOL finished) {
        [loadingView removeFromSuperview];
    }];
}
+ (void)showFailedMessage:(NSString *)message inView:(UIView *)view{
    CGSize contentSize = [self contentSizeOfMessage:message inView:view];
    
    //设置内容
    HerLoadingView *loadingView = [self loadingViewInView:view];
    if (loadingView.loadingType != kLoadingTypeLoading) {
        [loadingView removeFromSuperview];
        return;
    }
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
    [UIView animateWithDuration:0.3f delay:2.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [loadingView setAlpha:0];
    } completion:^(BOOL finished) {
        [loadingView removeFromSuperview];
    }];
}


+ (void)hideInView:(UIView *)view animated:(BOOL)animated{
    HerLoadingView *loadingView = (HerLoadingView *)[view viewWithTag:TAG_LOADINGVIEW];
    if (!loadingView) {
        return;
    }
    
    //隐藏动画
    if (animated) {
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [loadingView setAlpha:0];
        } completion:^(BOOL finished) {
            [loadingView removeFromSuperview];
        }];
    } else {
        [loadingView removeFromSuperview];
    }
}

@end
