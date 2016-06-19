//
//  NSString+HTTP.m
//  eather
//
//  Created by 青秀斌 on 14-6-12.
//  Copyright (c) 2014年 com.cdzlxt.iw. All rights reserved.
//

#import "NSString+HTTP.h"

@implementation NSString (HTTP)

- (NSString *)urlAction:(NSString *)action{
    return [[[NSURL URLWithString:self] URLByAppendingPathComponent:action] absoluteString];
}

@end
