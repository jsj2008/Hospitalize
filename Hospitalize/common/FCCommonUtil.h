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


/**
 *返回相应字符串的大小
 */
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font ContentMaxSize:(CGSize)contentMaxSize;

+(UIImage*) createImageWithColor:(UIColor*) color;

/**
 显示星星评价
 
 @param imageView1 星星1
 @param imageView2 星星2
 @param imageView3 星星3
 @param imageView4 星星4
 @param imageView5 星星5
 @param number 星星数量
 */
+(void)showTheStarWithImage:(UIImageView *)imageView1
                     image2:(UIImageView *)imageView2
                     image3:(UIImageView *)imageView3
                     image4:(UIImageView *)imageView4
                     image5:(UIImageView *)imageView5
                     number:(CGFloat)number;


/**
 * 按比例缩放图片,size 是你要把图显示到 多大区域。
 *
 * @param sourceImage 源图片对象
 * @param size        目标图片大小
 * @return 目标图片对象
 */
+ (UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

@end
