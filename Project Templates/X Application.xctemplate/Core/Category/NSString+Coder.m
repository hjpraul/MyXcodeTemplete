//
//  NSString+Coder.m
//  PalmSchool
//
//  Created by hjpraul on 16/5/19.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "NSString+Coder.h"

@implementation NSString (Coder)
// -Url encode
-(NSString *)urlEncode {
    NSString * encodedString = (NSString*) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 ));
    return encodedString;

}

// -Url decode
-(NSString *)urlDecode {
    NSString *tempStr = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    NSString *decodeString = [tempStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return decodeString;//[decodeString stringByReplacingOccurrencesOfString:@"+" withString:@" "];

}
@end
