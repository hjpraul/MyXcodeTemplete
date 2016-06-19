//
//  NSNull+Safe.m
//  PalmSchool
//
//  Created by hjpraul on 16/5/20.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "NSNull+Safe.h"

@implementation NSNull (Safe)
// TODO:log

- (NSInteger)integerValue {
    return 0;
}

- (NSInteger)length {
    return 0;
}

- (NSInteger)count {
    return 0;
}

- (BOOL)boolValue {
    return NO;
}
@end
