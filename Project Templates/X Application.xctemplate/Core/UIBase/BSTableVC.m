//
//  BSTableVC.m
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "BSTableVC.h"
#import "UIViewController+Base.h"

@interface BSTableVC ()

@end

@implementation BSTableVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [super viewDidLoad];
    [self customViewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUseCommonBackBar:(BOOL)useCommonBackBar {
    if (useCommonBackBar) {
        [self setBackBarVisible:YES];
    }
}

@end
