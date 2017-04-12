//
//  UIView+CircularBorder.h
//  nicai
//
//  Created by 花树峰 on 15/6/24.
//  Copyright (c) 2015年 QuCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerBorder)

/**
 * 边框颜色(16进制颜色字符串值)
 */
@property (nonatomic) IBInspectable NSString *borderColor;

/**
 * 边框宽度
 */
@property (nonatomic) IBInspectable CGFloat borderWidth;

/**
 * 边框圆角半径
 */
@property (nonatomic) IBInspectable CGFloat cornerRadius;

/**
 * 背景颜色(16进制颜色字符串值)
 */
@property (nonatomic) IBInspectable NSString *backgroundColorValue;

@end
