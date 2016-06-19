//
//  NSDate+Format.m
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/29.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)
- (NSString *)toShowYMD {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return [dateFormatter stringFromDate:self];
}

- (NSString *)toFullShow {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter stringFromDate:self];
}

- (NSString *)toPrettyShow {
    NSString *suffix = @"前";
    float different = [NSDate date].timeIntervalSince1970 - self.timeIntervalSince1970;
    if (different < 0) {
        different = -different;
        suffix = @"后";
    }

    if (different < 60) {   // lower than 60 seconds
        return @"刚刚";
    } else if (different < 60 * 60) {   // lower than 60 minutes
        return [NSString stringWithFormat:@"%d分钟%@", (int)floor(different / 60), suffix];
    } else if (different < 60*60*24) {  // lower than one day
        return [NSString stringWithFormat:@"%d小时%@", (int)floor(different / 3600), suffix];
    } else if (different < 60*60*24*30) {// lower than one week
        return [NSString stringWithFormat:@"%zd天%@", (int)floor(different/86400), suffix];
    } else {
        return [self toFullShow];
    }
}

- (NSString *)toNetFull {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:self];

    return dateStr;
}
@end
