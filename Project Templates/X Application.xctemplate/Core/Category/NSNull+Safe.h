//
//  NSNull+Safe.h
//  PalmSchool
//
//  Created by hjpraul on 16/5/20.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Safe)
- (NSInteger)integerValue;

- (NSInteger)length;

- (NSInteger)count;

- (BOOL)boolValue;
@end
