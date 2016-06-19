//
//  UIView+Loading.m
//  XFrameworkPackaging
//
//  Created by hjpraul on 15/4/22.
//  Copyright (c) 2015年 hjpraul. All rights reserved.
//

#import "UIView+Loading.h"
#import "HerLoadingView.h"
#import "VerLoadingView.h"

#define LOADING_IS_VERTICAL YES

@implementation UIView (Loading)
- (void)showLoadingWithMessage:(NSString *)message{
    if (LOADING_IS_VERTICAL) {
        [VerLoadingView showLoadingMessage:message inView:self];
    } else {
        [HerLoadingView showLoadingMessage:message inView:self];
    }
}

- (void)showSuccessWithMessage:(NSString *)message{
    if (LOADING_IS_VERTICAL) {
        [VerLoadingView showSuccessMessage:message inView:self];
    } else {
        [HerLoadingView showSuccessMessage:message inView:self];
    }
}

- (void)showFailedWithMessage:(NSString *)message{
    if (LOADING_IS_VERTICAL) {
        [VerLoadingView showFailedMessage:message inView:self];
    } else {
        [HerLoadingView showFailedMessage:message inView:self];
    }
}

- (void)hideLoading{
    if (LOADING_IS_VERTICAL) {
        [VerLoadingView hideInView:self animated:YES];
    } else {
        [HerLoadingView hideInView:self animated:YES];
    }
}

@end
