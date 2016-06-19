//
//  AppCache.h
//  LianghuaJifen
//
//  Created by Mac001 on 16/4/22.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentObjs.h"
#import "ORGObjs.h"

@interface AppCache : NSObject
@property (strong, nonatomic) Student *user;

+(AppCache *)shareInstance;
- (void)clean;

- (UIStoryboard *)launchSB;
- (UIStoryboard *)loginSB;
- (UIStoryboard *)campusSB;
- (UIStoryboard *)connectionSB;
- (UIStoryboard *)discoverSB;
- (UIStoryboard *)mineSB;
@end
