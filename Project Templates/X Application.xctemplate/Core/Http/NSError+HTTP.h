//
//  NSError+HTTP.h
//  Unionpay
//
//  Created by 青秀斌 on 14-6-18.
//  Copyright (c) 2014年 成都中信联通科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const RequestErrorDoman = @"RequestErrorDoman";
static NSString *const ResponseErrorDoman = @"ResponseErrorDoman";
static NSString *const BussinessErrorDoman = @"BussinessErrorDoman";

@interface NSError (HTTP)

+ (NSError *)reqeustError:(NSInteger)code message:(NSString *)message;
+ (NSError *)responseError:(NSInteger)code message:(NSString *)message;
+ (NSError *)bussinessError:(NSInteger)code message:(NSString *)message;

// 这里直接重写description
- (NSString *)errorMessage;

@end
