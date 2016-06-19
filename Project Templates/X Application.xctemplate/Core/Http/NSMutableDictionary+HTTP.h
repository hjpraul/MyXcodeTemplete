//
//  NSMutableDictionary+HTTP.h
//  eather
//
//  Created by 青秀斌 on 14-6-12.
//  Copyright (c) 2014年 com.cdzlxt.iw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (HTTP)

//当对象为空时，自动设置为NULL对象
- (void)setObject:(id)anObject forOBField:(id <NSCopying>)aKey;

//当对象为空时，不设置值
- (void)setObject:(id)anObject forOPField:(id <NSCopying>)aKey;

@end
