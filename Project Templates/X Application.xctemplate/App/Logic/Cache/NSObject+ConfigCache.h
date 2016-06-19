//
//  NSObject+ConfigCache.h
//  PalmSchool
//
//  Created by Mac001 on 16/5/23.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ConfigCache)
/**
 *  活动类型获取（带缓存更新）
 *
 *  @param success 成功回调返回活动类型列表（可能多次回调：刷新也会回调）
 *  @param failure 失败返回错误消息
 */
- (void)loadActTypesSuccess:(void(^)(NSArray *types))success
                    failure:(void(^)(NSError *error))failure;

/**
 *  活动预设地址获取（带缓存更新）
 *
 *  @param success 成功回调返回活动预设地址列表（可能多次回调：刷新也会回调）
 *  @param failure 失败返回错误消息
 */
- (void)loadActPresetAddressesSuccess:(void(^)(NSArray *addresses))success
                              failure:(void(^)(NSError *error))failure;

/**
 *  @brief 社团类型获取（带缓存更新）
 *
 *  @param success 成功回调返回社团类型列表
 *  @param failure 失败返回错误消息
 */
- (void)loadClubTypesSuccess:(void (^)(NSArray *types))success
                     failure:(void (^)(NSError *error))failure;
@end
