//
//  NSObject+API.m
//  SchoolPalmUser
//
//  Created by 青秀斌 on 15/10/11.
//  Copyright © 2015年 hjpraul. All rights reserved.
//

#import "NSObject+API.h"

static NSString *const serverUrl = @"http://124.161.115.161:8081/";    //服务器地址

id JSONObjectByRemovingKeysWithNullValues(id JSONObject) {
    if ([JSONObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[(NSArray *)JSONObject count]];
        for (id value in (NSArray *)JSONObject) {
            [mutableArray addObject:JSONObjectByRemovingKeysWithNullValues(value)];
        }
        return mutableArray;
    } else if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:JSONObject];
        for (id <NSCopying> key in [(NSDictionary *)JSONObject allKeys]) {
            id value = [(NSDictionary *)JSONObject objectForKey:key];
            if (!value || [value isEqual:[NSNull null]]) {
                [mutableDictionary removeObjectForKey:key];
            } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
                [mutableDictionary setObject:JSONObjectByRemovingKeysWithNullValues(value) forKey:key];
            }
        }
        return mutableDictionary;
    }
    return JSONObject;
}

@implementation NSObject (API)


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
                           success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *bodyDic))successBlock
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock{
    NSMutableString *realUrl = [NSMutableString stringWithFormat:@"%@%@",serverUrl,action];
    return [self GET:realUrl tag:tag params:^(NSMutableDictionary *dic) {
        if (params) {
            params(dic);
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        responseObject = JSONObjectByRemovingKeysWithNullValues(responseObject);
        NSDictionary *responseDic = [NSDictionary objectFromJSONData:responseObject];
        NSDictionary *headerDic = responseDic[@"Header"];
        NSDictionary *bodyDic = responseDic[@"Body"];
        BOOL success = [headerDic[@"ResultType"] boolValue];
        if (success) {
            if (successBlock) {
                successBlock(operation, bodyDic);
            }
        } else {
            NSInteger errorCode = [headerDic[@"ClientErrorCode"] integerValue];
            NSString *message = headerDic[@"Msg"];
            if (failureBlock) {
                failureBlock(operation, [NSError bussinessError:errorCode message:message]);
            }
        }
    } failure:failureBlock];
}


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
                            success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *bodyDic))successBlock
                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock{
    NSMutableString *realUrl = [NSMutableString stringWithFormat:@"%@%@",serverUrl,action];
    return [self POST:realUrl tag:tag params:^(NSMutableDictionary *dic) {
        if (params) {
            params(dic);
        }
    } bodyPart:bodyPart success:^(AFHTTPRequestOperation *operation, id responseObject) {
        responseObject = JSONObjectByRemovingKeysWithNullValues(responseObject);
        NSDictionary *responseDic = [NSDictionary objectFromJSONData:responseObject];
        NSDictionary *headerDic = responseDic[@"Header"];
        NSDictionary *bodyDic = responseDic[@"Body"];
        BOOL success = [headerDic[@"ResultType"] boolValue];
        if (success) {
            if (successBlock) {
                successBlock(operation, bodyDic);
            }
        } else {
            NSInteger errorCode = [headerDic[@"ResultType"] integerValue];
            NSString *message = headerDic[@"Msg"];
            if (failureBlock) {
                failureBlock(operation, [NSError bussinessError:errorCode message:message]);
            }
        }
    } failure:failureBlock];
}

@end
