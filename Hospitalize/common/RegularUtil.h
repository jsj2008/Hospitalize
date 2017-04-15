//
//  RegularUtil.h
//
//
//  Created by 周鑫 on 16/11/15.
//  Copyright (c) 2016年 HZTeam. All rights reserved.
//  信息检查工具
//

#import <Foundation/Foundation.h>

@interface RegularUtil : NSObject

/**
 * 检查是否是Email。
 */
+ (BOOL)isEmailAddress:(NSString *)candidate;

/**
 * 检查是否是电话号码。
 */
+ (BOOL)isTelephone:(NSString *)candidate;

/**
 * 检查是否是身份证号码。
 */
+ (BOOL)isIDNumber:(NSString *)candidate;

/**
 * 检查是否是数字。
 */
+ (BOOL)isNumber:(NSString *)candidate;

@end
