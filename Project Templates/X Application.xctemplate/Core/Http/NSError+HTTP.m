//
//  NSError+HTTP.m
//  Unionpay
//
//  Created by 青秀斌 on 14-6-18.
//  Copyright (c) 2014年 成都中信联通科技有限公司. All rights reserved.
//

#import "NSError+HTTP.h"

@implementation NSError (HTTP)

+ (NSError *)reqeustError:(NSInteger)code message:(NSString *)message{
    NSDictionary *userInfo = nil;
    if (message) {
        userInfo = @{NSLocalizedDescriptionKey: message};
    }
    return [NSError errorWithDomain:RequestErrorDoman code:code userInfo:userInfo];
}
+ (NSError *)responseError:(NSInteger)code message:(NSString *)message{
    NSDictionary *userInfo = nil;
    if (message) {
        userInfo = @{NSLocalizedDescriptionKey: message};
    }
    return [NSError errorWithDomain:ResponseErrorDoman code:code userInfo:userInfo];
}
+ (NSError *)bussinessError:(NSInteger)code message:(NSString *)message{
    NSDictionary *userInfo = nil;
    if (message) {
        userInfo = @{NSLocalizedDescriptionKey: message};
    }
    return [NSError errorWithDomain:BussinessErrorDoman code:code userInfo:userInfo];
}


- (NSString *)errorMessage{
    NSString *message = nil;
    switch (self.code) {
//        case kCFHostErrorHostNotFound:{
//            message = @"网络无法连接";
//        }break;
        case NSURLErrorCancelled:{
            message = @"请求取消";
        }break;
        case NSURLErrorBadURL:{
            message = @"地址出错";
        }break;
        case NSURLErrorTimedOut:{
            message = @"连接超时，请稍后重试";
        }break;
        case NSURLErrorCannotFindHost:{
            message = @"服务器未找到";
        }break;
        case NSURLErrorCannotConnectToHost:{
            message = @"暂时无法连接";
        }break;
        case NSURLErrorNetworkConnectionLost:{
            message = @"网络连接丢失";
        }break;
        case NSURLErrorBadServerResponse:{
            message = @"服务器响应出错";
        }break;
        case NSURLErrorCannotDecodeContentData:{
            message = @"不能解码响应数据";
        }break;
        case NSURLErrorCannotParseResponse:{
            message = @"不能解析响应数据";
        }break;
        case NSURLErrorNotConnectedToInternet:{
            message = @"网络已断开，请连接后重试";
        }break;
        default:{
            message = [self.userInfo objectForKey:@"NSLocalizedDescription"];
//            message = @"网络连接出错,请稍后重试";
        }break;
    }
    return message;
}

@end
