//
//  NSObject+ConfigCache.m
//  PalmSchool
//
//  Created by Mac001 on 16/5/23.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "NSObject+ConfigCache.h"
#import "NSObject+ORGActivityAPI.h"
#import "NSObject+ORGAPI.h"

@implementation NSObject (ConfigCache)
/**
 *  活动类型获取（带缓存更新）
 *
 *  @param success 成功回调返回活动类型列表（可能多次回调：刷新也会回调）
 *  @param failure 失败返回错误消息
 */
- (void)loadActTypesSuccess:(void(^)(NSArray *types))success
                    failure:(void(^)(NSError *error))failure {
    NSArray *typesInDisk = [DBManager loadObjectsFromTable:kDBTableActType class:[ORGActivityType class] range:NSMakeRange(0, 0)];
    if (typesInDisk.count > 0) {
        BLOCK_SAFE(success)(typesInDisk);
    }
    [self getActivitiyTypesSuccess:^(NSArray *types) {
        BLOCK_SAFE(success)(types);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DBManager storeObjects:types toTable:kDBTableActType class:[ORGActivityType class] primaryKey:@"SAT_ID"];
        });
    } failure:^(NSError *error) {
        if (typesInDisk.count <= 0) {
            BLOCK_SAFE(failure)(error);
        }
    }];
}

/**
 *  活动预设地址获取（带缓存更新）
 *
 *  @param success 成功回调返回活动预设地址列表（可能多次回调：刷新也会回调）
 *  @param failure 失败返回错误消息
 */
- (void)loadActPresetAddressesSuccess:(void(^)(NSArray *addresses))success
                              failure:(void(^)(NSError *error))failure {
    NSArray *addressesInDisk = [DBManager loadObjectsFromTable:kDBTableActAddress class:[ORGActivityAddress class] range:NSMakeRange(0, 0)];
    if (addressesInDisk.count > 0) {
        BLOCK_SAFE(success)(addressesInDisk);
    }
    [self getPresetActivitiyAddressesSuccess:^(NSArray *addresses) {
        BLOCK_SAFE(success)(addresses);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DBManager storeObjects:addresses toTable:kDBTableActAddress class:[ORGActivityAddress class] primaryKey:@"SAA_ID"];
        });
    } failure:^(NSError *error) {
        if (addressesInDisk.count <= 0) {
            BLOCK_SAFE(failure)(error);
        }
    }];
}

/**
 *  @brief 社团类型获取（带缓存更新）
 *
 *  @param success 成功回调返回社团类型列表
 *  @param failure 失败返回错误消息
 */
- (void)loadClubTypesSuccess:(void (^)(NSArray *types))success
                     failure:(void (^)(NSError *error))failure {
    NSArray *clubTypesInDisk = [DBManager loadObjectsFromTable:kDBTableClubType class:[ORGType class] range:NSMakeRange(0, 0)];
    if (clubTypesInDisk.count > 0) {
        BLOCK_SAFE(success)(clubTypesInDisk);
    }
    [self getORGTypeWithSuccess:^(NSArray *orgTypeArr) {
        BLOCK_SAFE(success)(orgTypeArr);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DBManager storeObjects:orgTypeArr toTable:kDBTableClubType class:[ORGActivityAddress class] primaryKey:@"SAT_ID"];
        });
    } failure:^(NSError *error) {
        if (clubTypesInDisk.count <= 0) {
            BLOCK_SAFE(failure)(error);
        }
    }];
}
@end
