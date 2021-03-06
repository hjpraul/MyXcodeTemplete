//
//  BSAlertView.m
//  LoveCook
//
//  Created by hjpraul on 13-8-18.
//  Copyright (c) 2013年 lovecook. All rights reserved.
//

#import "BSAlertView.h"

#define ANIMATION_DURATION  (0.3f)
#define DELAY_DURATION      (0.0f)

typedef void (^AnimationBlock)();
typedef void (^AnimationCompletionBlock)(BOOL);

@interface BSAlertView()
@property (nonatomic, retain) UIWindow *alertWindow;
@property (nonatomic, retain) UIImageView *dimImageView;
@end

@implementation BSAlertView

- (id)init{
    self = [super init];
    if (self) {
        [self initAlert];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initAlert];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initAlert];
    }
    return self;
}

- (void)initAlert{
    [self setPresentationStyle:AlertViewPresentationStyleFade];
    [self setDismissalStyle:AlertViewDismissalStyleFade];
    [self setEnterDirection:AlertViewEnterDirectionFromRight];
    [self setExitDirection:AlertViewExitDirectionToLeft];
    [self setPosition:AlertViewPositionCenter];
}

#pragma mark - Private Method
- (UIImage *)backgroundGradientImageWithSize:(CGSize)size{
	CGPoint center = CGPointMake(size.width * 0.5, size.height * 0.5);
	CGFloat innerRadius = 0;
    CGFloat outerRadius = sqrtf(size.width * size.width + size.height * size.height) * 0.5;
    
	BOOL opaque = NO;
    UIGraphicsBeginImageContextWithOptions(size, opaque, [[UIScreen mainScreen] scale]);
	CGContextRef context = UIGraphicsGetCurrentContext();
    
    const size_t locationCount = 2;
    CGFloat locations[locationCount] = { 0.0, 0.8 };
    CGFloat components[locationCount * 4] = {
		0.0, 0.0, 0.0, 0.4, // More transparent black
		0.0, 0.0, 0.0, 0.5  // More opaque black
	};
	
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, locationCount);
	
    CGContextDrawRadialGradient(context, gradient, center, innerRadius, center, outerRadius, 0);
	
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGColorSpaceRelease(colorspace);
    CGGradientRelease(gradient);
	
    return image;
}

- (void)setStartPosition {
    if (_presentationStyle == AlertViewPresentationStylePush) {
        switch (_enterDirection) {
            case AlertViewEnterDirectionFromTop:
                self.center = CGPointMake(Util.screenWidth/2, -self.height/2);
                break;
            case AlertViewEnterDirectionFromLeft:
                self.center =  CGPointMake(-self.width/2, Util.screenHeight/2);
                break;
            case AlertViewEnterDirectionFromBottom:
                self.center =  CGPointMake(Util.screenWidth/2, Util.screenHeight+self.height/2);
                break;
            case AlertViewEnterDirectionFromRight:
                self.center =  CGPointMake(Util.screenWidth+self.width/2, Util.screenHeight/2);
                break;
            default:
                break;
        }
    } else {
        [self setFinalShowPosition];
    }
}

- (void)setFinalShowPosition {
    switch (_position) {
        case AlertViewPositionTop:
            self.center = CGPointMake(Util.screenWidth/2, self.height/2);
            break;
        case AlertViewPositionLeft:
            self.center =  CGPointMake(self.width/2, Util.screenHeight/2);
            break;
        case AlertViewPositionBottom:
            self.center =  CGPointMake(Util.screenWidth/2, Util.screenHeight-self.height/2);
            break;
        case AlertViewPositionRight:
            self.center =  CGPointMake(Util.screenWidth-self.width/2, Util.screenHeight/2);
            break;
        case AlertViewPositionCenter:
        default:
            self.center =  CGPointMake(Util.screenWidth/2, Util.screenHeight/2);
            break;
    }
}

- (void)setDismissPosition {
    if (_dismissalStyle == AlertViewDismissalStylePush) {
        switch (_exitDirection) {
            case AlertViewExitDirectionToTop:
                self.center = CGPointMake(Util.screenWidth/2, -self.height/2);
                break;
            case AlertViewExitDirectionToLeft:
                self.center =  CGPointMake(-self.width/2, Util.screenHeight/2);
                break;
            case AlertViewExitDirectionToBottom:
                self.center =  CGPointMake(Util.screenWidth/2, Util.screenHeight+self.height/2);
                break;
            case AlertViewExitDirectionToRight:
                self.center =  CGPointMake(Util.screenWidth+self.width/2, Util.screenHeight/2);
                break;
            default:
                break;
        }
    } else {
        [self setFinalShowPosition];
    }
}

- (void)performPresentationAnimation{
    switch (self.presentationStyle) {
        case AlertViewPresentationStyleNone:{
            
        }break;
        case AlertViewPresentationStylePop:{
            CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animation];
            bounceAnimation.duration = 0.3f;
            bounceAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            bounceAnimation.values = @[@0.01f,@1.1f,@0.9f,@1.0f];
            [self.layer addAnimation:bounceAnimation forKey:@"transform.scale"];
            
            CABasicAnimation *fadeInAnimation = [CABasicAnimation animation];
            fadeInAnimation.duration = 0.3f;
            fadeInAnimation.fromValue = @0.0f;
            fadeInAnimation.toValue = @1.0f;
            [self.dimImageView.layer addAnimation:fadeInAnimation forKey:@"opacity"];
        }break;
        case AlertViewPresentationStyleFade:{
            [self setAlpha:0.0f];
            [self.dimImageView setAlpha:0.0f];
            [UIView animateWithDuration:ANIMATION_DURATION delay:DELAY_DURATION options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self setAlpha:1.0f];
                [self.dimImageView setAlpha:1.0f];
            } completion:nil];
        }break;
        case AlertViewPresentationStylePush:{
            [self setStartPosition];
            [self.dimImageView setAlpha:0.0f];
            [UIView animateWithDuration:ANIMATION_DURATION delay:DELAY_DURATION options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self setFinalShowPosition];
                [self.dimImageView setAlpha:1.0f];
            } completion:nil];
        }break;
        default:break;
    }
}

- (void)performDismissalAnimation{
    
    AnimationCompletionBlock completionBlock = ^(BOOL finished){
        [self.dimImageView removeFromSuperview];
        [self removeFromSuperview];
        
        [self.previousWindow makeKeyWindow];
        [self setPreviousWindow:nil];
        [self setDimImageView:nil];
        [self setAlertWindow:nil];
        BLOCK_SAFE(_dismissBlock)();
    };
    
    switch (self.dismissalStyle) {
        case AlertViewDismissalStyleNone:{
            completionBlock(YES);
        }break;
        case AlertViewDismissalStyleZoomIn:{
            [UIView animateWithDuration:ANIMATION_DURATION delay:DELAY_DURATION options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self setTransform:CGAffineTransformConcat(self.transform, CGAffineTransformMakeScale(0.01, 0.01))];
                [self setAlpha:0.0f];
                [self.dimImageView setAlpha:0.0f];
            } completion:completionBlock];
        }break;
        case AlertViewDismissalStyleZoomOut:{
            [UIView animateWithDuration:ANIMATION_DURATION delay:DELAY_DURATION options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self setTransform:CGAffineTransformConcat(self.transform, CGAffineTransformMakeScale(10, 10))];
                [self setAlpha:0.0f];
                [self.dimImageView setAlpha:0.0f];
            } completion:completionBlock];
        }break;
        case AlertViewDismissalStyleFade:{
            [UIView animateWithDuration:ANIMATION_DURATION delay:DELAY_DURATION options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self setAlpha:0.0f];
                [self.dimImageView setAlpha:0.0f];
            } completion:completionBlock];
        }break;
        case AlertViewDismissalStylePush:{
            [UIView animateWithDuration:ANIMATION_DURATION delay:DELAY_DURATION options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self setDismissPosition];
                [self.dimImageView setAlpha:0.0f];
            } completion:completionBlock];
        }break;
        default:{
        }break;
    }
}

// 点旁边dismiss
- (void)imgBgTapped:(UITapGestureRecognizer *)sender{
    if (_enableClickBGToDismiss) {
        [self dismiss];
    }
}

#pragma mark - Public Method

- (void)show{
    [self showWithStyle:self.presentationStyle];
}

- (void)showWithStyle:(AlertViewPresentationStyle)presentationStyle{
    [self setPresentationStyle:presentationStyle];
    
    //记住KeyWindow
    [self setPreviousWindow:[[UIApplication sharedApplication] keyWindow]];
    
    //设置AlertWindow
    CGRect bounds = [[UIScreen mainScreen] bounds];
    UIWindow *window = [[UIWindow alloc] initWithFrame:bounds];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor clearColor];
    window.rootViewController = vc;
    [window setWindowLevel:UIWindowLevelAlert];
    [window makeKeyAndVisible];
    [self setAlertWindow:window];
    
    
    //设置遮罩背景
    UIImage *bgImage = [self backgroundGradientImageWithSize:bounds.size];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:bounds];
    [imageView setUserInteractionEnabled:YES];
    [imageView setImage:bgImage];
    [self setDimImageView:imageView];
	[vc.view addSubview:imageView];
    
    // 增加点击背景关闭的手势
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgBgTapped:)];
    [imageView addGestureRecognizer:gesture];
    
    //设置提示弹框
    [self setFinalShowPosition];
	[vc.view addSubview:self];
    
	//出入场动画
    [self performPresentationAnimation];
//	[self performSelector:@selector(performPresentationAnimation) withObject:nil afterDelay:0];
}

- (void)dismiss{
    BLOCK_SAFE(_dismissBlock)();
    [self dismissWithStyle:self.dismissalStyle];
}
- (void)dismissWithStyle:(AlertViewDismissalStyle)dismissalStyle{
    [self setDismissalStyle:dismissalStyle];
    
    //隐藏键盘
	[self endEditing:YES];
    
	//出场动画
	[self performDismissalAnimation];
}

@end
