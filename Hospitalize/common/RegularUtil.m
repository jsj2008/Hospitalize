//
//  RegularUtil.m
//
//
//  Created by 周鑫 on 16/11/15.
//  Copyright (c) 2016年 HZTeam. All rights reserved.
//  信息检查工具
//

#import "RegularUtil.h"

@implementation RegularUtil

/**
 * 检查是否是Email。
 */
+ (BOOL)isEmailAddress:(NSString*)candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}
/**
 * 检查是否是电话号码。
 */
+ (BOOL)isTelephone:(NSString *)candidate {
//    NSString *regex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSString *regex = @"^(13[0-9]|15[0-9]|14[0-9]|18[0-9]|17[0-9])[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:candidate];
    return isMatch;
}

/**
 * 检查是否是身份证号码。
 */
+ (BOOL)isIDNumber:(NSString *)candidate {
    NSString *regex = @"^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:candidate];
    return isMatch;
}

/**
 * 检查是否是数字。
 */
+ (BOOL)isNumber:(NSString *)candidate {
    NSString *regex = @"[0-9]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:candidate];
    return isMatch;
}

@end
