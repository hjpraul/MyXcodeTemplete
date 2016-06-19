//
//  BSVC.m
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "BSVC.h"
#import "UIViewController+Base.h"

@interface BSVC ()

@end

@implementation BSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customViewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setUseCommonBackBar:(BOOL)useCommonBackBar {
    if (useCommonBackBar) {
        [self setBackBarVisible:YES];
    }
}

@end
