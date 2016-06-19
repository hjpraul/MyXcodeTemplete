//
//  UIView+BGLoading.m
//  XFrameworkPackaging
//
//  Created by hjpraul on 15/5/27.
//  Copyright (c) 2015年 hjpraul. All rights reserved.
//

#import "UIView+BGLoading.h"
#import "BGHerLoadingView.h"
#import "BGVerLoadingView.h"

#define BG_LOADING_IS_VERTICAL YES

@implementation UIView (BGLoading)
- (void)showBGLoadingWithMessage:(NSString *)message{
    if (BG_LOADING_IS_VERTICAL) {
        [BGVerLoadingView showLoadingMessage:message inView:self];
    } else {
        [BGHerLoadingView showLoadingMessage:message inView:self];
    }
}
- (void)showBGFailedWithMessage:(NSString *)message{
    if (BG_LOADING_IS_VERTICAL) {
        [BGVerLoadingView showFailedMessage:message inView:self];
    } else {
        [BGHerLoadingView showFailedMessage:message inView:self];
    }
}
- (void)showBGNoInfoWithMessage:(NSString *)message{
    if (BG_LOADING_IS_VERTICAL) {
        [BGVerLoadingView showNoInfoMessage:message inView:self];
    } else {
        [BGHerLoadingView showNoInfoMessage:message inView:self];
    }
}
- (void)hideBGLoading{
    if (BG_LOADING_IS_VERTICAL) {
        [BGVerLoadingView hideInView:self animated:NO];
    } else {
        [BGHerLoadingView hideInView:self animated:NO];
    }
}
@end
