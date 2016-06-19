//
//  NSObject+API.h
//  SchoolPalmUser
//
//  Created by 青秀斌 on 15/10/11.
//  Copyright © 2015年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+HTTP.h"

@interface NSObject (API)

/**
 * 接口GET方法
 * 注：已对Session作处理，无需再传sessionId参数
 * 注：返回数据已JOSN反序列化
 *
 * @param successBlock  成功回调（operation:请求对象，responseObject:成功是返回对象）
 * @param failureBlock  失败回调（operation:请求对象，error:错误信息）
 */
- (AFHTTPRequestOperation *)PS_GET:(NSString *)action
                               tag:(NSInteger)tag
                            params:(void (^)(NSMutableDictionary *params))params
                           success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDic))successBlock
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


/**
 * 接口POST方法
 * 注：已对Session作处理，无需再传sessionId参数
 * 注：返回数据已JOSN反序列化
 *
 * @param successBlock  成功回调（operation:请求对象，responseObject:成功是返回对象）
 * @param failureBlock  失败回调（operation:请求对象，error:错误信息）
 */
- (AFHTTPRequestOperation *)PS_POST:(NSString *)action
                                tag:(NSInteger)tag
                             params:(void (^)(NSMutableDictionary *params))params
                           bodyPart:(void (^)(id <AFMultipartFormData> formData))bodyPart
                            success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDic))successBlock
                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
