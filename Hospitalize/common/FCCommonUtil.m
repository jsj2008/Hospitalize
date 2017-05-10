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
 得到请求header
 
 @return ReqHeader
 */
+(NMTFReqHeader *)getHeader{
    NMTFReqHeader *header = [NMEmartClientManager getHeader:YES];
    return header;
}

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

+(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 显示星星评价

 @param imageView1 星星1
 @param imageView2 星星2
 @param imageView3 星星3
 @param imageView4 星星4
 @param imageView5 星星5
 @param number 星星数量
 
 home_icon_star_bankehuangxing 半星
 home_icon_star_quanhuangxing 全星
 home_icon_star_quanxing 零星
 */
+(void)showTheStarWithImage:(UIImageView *)imageView1
                     image2:(UIImageView *)imageView2
                     image3:(UIImageView *)imageView3
                     image4:(UIImageView *)imageView4
                     image5:(UIImageView *)imageView5
                     number:(CGFloat)number{

}


/**
 * 按比例缩放图片,size 是你要把图显示到 多大区域。
 *
 * @param sourceImage 源图片对象
 * @param size        目标图片大小
 * @return 目标图片对象
 */
+ (UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if (CGSizeEqualToSize(imageSize, size) == NO) {
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor) {
            scaleFactor = widthFactor;
        } else {
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if (widthFactor > heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if(widthFactor < heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (newImage == nil) {
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}


@end
