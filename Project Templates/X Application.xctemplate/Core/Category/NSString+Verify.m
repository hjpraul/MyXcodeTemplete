//
//  NSString+Verify.m
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "NSString+Verify.h"

@implementation NSString (Verify)
- (BOOL)isLegalPhoneNum{
    if (![self isPureInt]) {
        return NO;
    } else if (self.length != 11) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)isLegalEmailAddr{
    if((0 != [self rangeOfString:@"@"].length) &&
       (0 != [self rangeOfString:@"."].length))
    {
        NSCharacterSet* tmpInvalidCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSMutableCharacterSet* tmpInvalidMutableCharSet = [tmpInvalidCharSet mutableCopy];
        [tmpInvalidMutableCharSet removeCharactersInString:@"_-"];

        /*
         *使用compare option 来设定比较规则，如
         *NSCaseInsensitiveSearch是不区分大小写
         *NSLiteralSearch 进行完全比较,区分大小写
         *NSNumericSearch 只比较定符串的个数，而不比较字符串的字面值
         */
        NSRange range1 = [self rangeOfString:@"@"
                                     options:NSCaseInsensitiveSearch];

        //取得用户名部分
        NSString* userNameString = [self substringToIndex:range1.location];
        NSArray* userNameArray   = [userNameString componentsSeparatedByString:@"."];

        for(NSString* string in userNameArray)
        {
            NSRange rangeOfInavlidChars = [string rangeOfCharacterFromSet: tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length != 0 || [string isEqualToString:@""])
                return NO;
        }

        //取得域名部分
        NSString *domainString = [self substringFromIndex:range1.location+1];
        NSArray *domainArray   = [domainString componentsSeparatedByString:@"."];

        for(NSString *string in domainArray)
        {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }

        return YES;
    }
    else {
        return NO;
    }
}

-(BOOL)isLegalPasswd{
    BOOL hasAlpha = NO;
    BOOL hasNum = NO;
    int len = (int)self.length;
    if (len < 8 || len > 16) {
        return NO;
    }

    for(int i = 0; i < len; i++) {
        unichar a = [self characterAtIndex:i];
        if((isalpha(a))){
            hasAlpha = YES;
        } else if((isalnum(a))) {
            hasNum = YES;
        }
    }

    if (hasNum && hasAlpha) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

// 是否是金额表示方式
- (BOOL)isAmount {
    if (![self isPureFloat] && ![self isPureInt]) {
        return NO;
    }

    NSRange range = [self rangeOfString:@"."];
    if ((range.location+range.length < self.length-2) && range.length!=0) {
        return NO;
    }

    return YES;
}
@end
