//
//  NSObject+JSON.h
//  LianghuaJifen
//
//  Created by hjpraul on 16/5/1.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSON)
- (NSData *)JSONData;
- (NSString *)JSONString;
+ (id)objectFromJSONData:(NSData *)jsonData;
+ (id)objectFromJSONString:(NSString *)jsonString;
@end
