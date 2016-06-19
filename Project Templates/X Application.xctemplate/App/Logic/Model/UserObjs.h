//
//  StudentObjs.h
//  PalmSchool
//
//  Created by hjpraul on 16/5/5.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>

// 学生状态
typedef NS_ENUM(NSInteger,StudentStatus) {
    kStudentStatusDeleted,      // 已删除
    kStudentStatusNormal,       // 正常
    kStudentStatusNotActived,   // 未激活
    kStudentStatusDisable,      // 禁用
};

// 学生信息
@interface Student : NSObject
@property (assign, nonatomic) NSInteger UU_ID;              // 用户ID
@property (assign, nonatomic) NSInteger UU_GUID;            // GUID
@property (strong, nonatomic) NSString *UU_Mobile;          // 手机号码
@property (strong, nonatomic) NSString *UU_Photo;           // 用户头像
@property (assign, nonatomic) NSInteger UU_US_ID;           // 学校ID
@property (assign, nonatomic) NSInteger UU_UD_ID;           // 院系ID
@property (strong, nonatomic) NSString *UD_Name;            // 院系名称
@property (assign, nonatomic) NSInteger UU_UM_ID;           // 专业ID
@property (strong, nonatomic) NSString *UM_Name;            // 专业名称
@property (assign, nonatomic) NSInteger UU_UGC_ID;          // 年级ID
@property (strong, nonatomic) NSString *UGC_GradeName;      // 年级名称
@property (strong, nonatomic) NSString *UGC_ClassName;      // 班级名称
@property (assign, nonatomic) NSInteger UU_Integral;        // 积分
@property (assign, nonatomic) NSInteger UU_IntegralLevel;   // 积分等级
@property (assign, nonatomic) StudentStatus UU_Status;      // 用户状态
@property (strong, nonatomic) NSString *UU_IdentityCode;    // 身份证号
@property (strong, nonatomic) NSString *UU_NlT_Account;     // 买乐返账号
@property (strong, nonatomic) NSString *UU_Account;         // 登录账号
@property (strong, nonatomic) NSString *UU_PWD;             // UU_PWD
@property (strong, nonatomic) NSString *UU_Name;            // 用户名
@property (strong, nonatomic) NSString *UU_StudentNUM;      // 学号
@property (strong, nonatomic) NSString *UU_VerCode;         // 验证码
@property (strong, nonatomic) NSString *UU_VerDate;         // 验证码过期时间
@property (strong, nonatomic) NSString *UU_ActivateTime;    // 激活时间
@end
