//
//  FCCommonUtil.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/11.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FCCommonUtil : NSObject

/**
 *  转换16进制颜色值为UIColor对象。
 *
 *  @param color 6进制颜色值
 *  @return UIColor对象
 */
+ (UIColor*)colorWithHexString:(NSString *) color;

/**
 *  判断字符串是否为空字符串。
 *
 *  @return true:是 false:不是
 */
+ (BOOL) isEmpty:(NSString *) value;

@end
