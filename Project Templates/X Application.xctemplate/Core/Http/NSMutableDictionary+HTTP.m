//
//  NSMutableDictionary+HTTP.m
//  eather
//
//  Created by 青秀斌 on 14-6-12.
//  Copyright (c) 2014年 com.cdzlxt.iw. All rights reserved.
//

#import "NSMutableDictionary+HTTP.h"

@implementation NSMutableDictionary (HTTP)

//当对象为空时，自动设置为NULL对象
- (void)setObject:(id)anObject forOBField:(id <NSCopying>)aKey{
    if (anObject != nil) {
        [self setObject:anObject forKey:aKey];
    } else {
        [self setObject:[NSNull null] forKey:aKey];
    }
}

//当对象为空时，不设置值
- (void)setObject:(id)anObject forOPField:(id <NSCopying>)aKey{
    if (anObject != nil) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
