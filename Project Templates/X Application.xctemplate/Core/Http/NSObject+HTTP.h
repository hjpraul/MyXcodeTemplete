//
//  NSObject+HTTP.h
//  eather
//
//  Created by 青秀斌 on 14-6-10.
//  Copyright (c) 2014年 com.cdzlxt.iw. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "NSError+HTTP.h"
#import "NSString+HTTP.h"
#import "NSMutableDictionary+HTTP.h"

@interface NSObject (HTTP)
@property (nonatomic) NSOperationQueue *httpOperationQueue;
@property (nonatomic) dispatch_queue_t httpCompletionQueue;
@property (nonatomic) dispatch_group_t httpCompletionGroup;
@property (nonatomic) AFHTTPRequestSerializer <AFURLRequestSerialization> *httpRequestSerializer;
@property (nonatomic) AFHTTPResponseSerializer <AFURLResponseSerialization> *httpResponseSerializer;


//GET请求
- (AFHTTPRequestOperation *)GET:(NSString *)url tag:(NSInteger)tag
                         params:(void (^)(NSMutableDictionary *params))params
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

//POST请求
- (AFHTTPRequestOperation *)POST:(NSString *)url tag:(NSInteger)tag
                          params:(void (^)(NSMutableDictionary *params))params
                        bodyPart:(void (^)(id <AFMultipartFormData> formData))bodyPart
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

//处理请求
- (void)handleRequest:(AFHTTPRequestOperation *)httpOperation
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


//取消指定请求
- (void)cancelHttpRequest:(NSInteger)tag;

//取消所有请求
- (void)cancelAllHttpReqeust;

@end