//
//  NSDate+Format.h
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/29.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)
- (NSString *)toShowYMD;
- (NSString *)toFullShow;
- (NSString *)toPrettyShow;
- (NSString *)toNetFull;
@end
