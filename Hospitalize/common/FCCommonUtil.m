//
//  FCCommonUtil.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/11.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "FCCommonUtil.h"

@implementation FCCommonUtil


/**
 *  转换16进制颜色值为UIColor对象。
 *
 *  @param color 6进制颜色值
 *  @return UIColor对象
 */
+ (UIColor*)colorWithHexString:(NSString *) color {
    NSString *strColor = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([strColor length] < 6) {
        return [UIColor clearColor];
    }
    if ([strColor hasPrefix:@"0X"] || [strColor hasPrefix:@"0x"]) {
        strColor = [strColor substringFromIndex:2];
    } else if ([strColor hasPrefix:@"#"]) {
        strColor = [strColor substringFromIndex:1];
    }
    if ([strColor length] < 6) {
        return [UIColor clearColor];
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
    // 获取16进制红色颜色字符串
    NSString *redString = [strColor substringWithRange:range];
    // 获取16进制绿色颜色字符串
    range.location = 2;
    NSString *greenString = [strColor substringWithRange:range];
    // 获取16进制蓝色颜色字符串
    range.location = 4;
    NSString *blueString = [strColor substringWithRange:range];
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
    return [UIColor colorWithRed:((float)red / 255.0f) green:((float)green / 255.0f) blue:((float)blue / 255.0f) alpha:1.0f];
}


/**
 *  判断字符串是否为空字符串。
 *
 *  @return true:是 false:不是
 */
+ (BOOL) isEmpty:(NSString *) value {
    if (value == nil) {
        return YES;
    }
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value isEqualToString:@""]) {
        return YES;
    }
    return NO;
}


/**
 *定义成方法方便多个label调用 增加代码的复用性
 */
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font ContentMaxSize:(CGSize)contentMaxSize {
    //采用换行模式
    NSStringDrawingOptions options  = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin;
    CGRect rect = [string boundingRectWithSize:contentMaxSize options:options attributes:@{NSFontAttributeName: font} context:nil];
    return rect.size;
}


@end
