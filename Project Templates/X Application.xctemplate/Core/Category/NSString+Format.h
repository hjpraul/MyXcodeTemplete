//
//  NSString+Format.h
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Format)
// 替换掉电话中某些特殊的字符
- (NSString *)toPurePhoneNum;

- (NSDate *)netDateToDate;

@end
