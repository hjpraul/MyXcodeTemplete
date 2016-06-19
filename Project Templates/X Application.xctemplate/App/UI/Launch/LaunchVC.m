//
//  LaunchVC.m
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "LaunchVC.h"

@interface LaunchVC ()

@end

@implementation LaunchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLayoutSubviews {
    [self performSelector:@selector(realLaunch) withObject:nil afterDelay:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
- (void)realLaunch {
    [UIView transitionWithView:[UIApplication sharedApplication].delegate.window duration:0.6 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState=[UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
//        [UIApplication sharedApplication].delegate.window.rootViewController = [AppCache shareInstance].loginSB.instantiateInitialViewController;
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        ; // do nothing
    }];
}

@end
