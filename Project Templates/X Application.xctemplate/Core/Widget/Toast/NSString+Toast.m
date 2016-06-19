//
//  NSString+Toast.m
//  XFrameworkPackaging
//
//  Created by hjpraul on 15/4/16.
//  Copyright (c) 2015年 hjpraul. All rights reserved.
//

#import "NSString+Toast.h"
#import "Toast.h"

@implementation NSString (Toast)
- (void)toast{
    [Toast showWithText:self];
}
@end
