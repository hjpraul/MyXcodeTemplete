//
//  AppCache.m
//  LianghuaJifen
//
//  Created by Mac001 on 16/4/22.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "AppCache.h"

static AppCache *instance = nil;

static UIStoryboard *launchSB = nil;
static UIStoryboard *loginSB = nil;
static UIStoryboard *campusSB = nil;
static UIStoryboard *connectionSB = nil;
static UIStoryboard *discoverSB = nil;
static UIStoryboard *mineSB = nil;

@implementation AppCache
+(AppCache *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AppCache alloc] init];
    });
    
    return instance;
}

- (void)clean {
}

- (UIStoryboard *)launchSB{
    if (launchSB == nil) {
        launchSB = [UIStoryboard storyboardWithName:@"Launch" bundle:nil];
    }
    return launchSB;
}

- (UIStoryboard *)loginSB{
    if (loginSB == nil) {
        loginSB = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    }
    return loginSB;
}

- (UIStoryboard *)campusSB{
    if (campusSB == nil) {
        campusSB = [UIStoryboard storyboardWithName:@"Campus" bundle:nil];
    }
    return campusSB;
}

- (UIStoryboard *)connectionSB{
    if (connectionSB == nil) {
        connectionSB = [UIStoryboard storyboardWithName:@"Connection" bundle:nil];
    }
    return connectionSB;
}

- (UIStoryboard *)discoverSB{
    if (discoverSB == nil) {
        discoverSB = [UIStoryboard storyboardWithName:@"Discover" bundle:nil];
    }
    return discoverSB;
}

- (UIStoryboard *)mineSB{
    if (mineSB == nil) {
        mineSB = [UIStoryboard storyboardWithName:@"Mine" bundle:nil];
    }
    return mineSB;
}
@end
