//
//  NSObject+JSON.m
//  LianghuaJifen
//
//  Created by hjpraul on 16/5/1.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "NSObject+JSON.h"

@implementation NSObject (JSON)
- (NSData *)JSONData{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        if (error) {
            NSLog(@"JSON序列化出错--->error:%@",error);
        }
        return jsonData;
    } else {
        NSLog(@"JSON序列化出错--->error:存在非法数据类型");
        return nil;
    }
}
- (NSString *)JSONString{
    return [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
}

+ (id)objectFromJSONData:(NSData *)jsonData{
    NSError *error = nil;
    NSJSONReadingOptions options = NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:options error:&error];
    if (error) {
        NSLog(@"解析JSON出错--->error:%@",error);
        return nil;
    }
    return jsonObject;
}

+ (id)objectFromJSONString:(NSString *)jsonString{
    return [NSObject objectFromJSONData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
}
@end
