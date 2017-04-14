//
//  FCMacros.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/11.
//  Copyright © 2017年 feichang. All rights reserved.
//

#ifndef FCMacros_h
#define FCMacros_h

#define COLOR4B89DC [FCCommonUtil colorWithHexString:@"4B89DC"]
#define COLOR85B7F9 [FCCommonUtil colorWithHexString:@"85B7F9"]
#define COLORAEC5E6 [FCCommonUtil colorWithHexString:@"AEC5E6"]
#define COLORFF5757 [FCCommonUtil colorWithHexString:@"FF5757"]
#define COLORBDE0BC [FCCommonUtil colorWithHexString:@"BDE0BC"]

#define COLORFDCCCC [FCCommonUtil colorWithHexString:@"FDCCCC"]
#define COLORFC7845 [FCCommonUtil colorWithHexString:@"FC7845"]
#define COLORFF4800 [FCCommonUtil colorWithHexString:@"FF4800"]
#define COLOREFF3F6 [FCCommonUtil colorWithHexString:@"EFF3F6"]
#define COLORD5D5D5 [FCCommonUtil colorWithHexString:@"D5D5D5"]
#define COLOR666666 [FCCommonUtil colorWithHexString:@"666666"]
#define COLOR333333 [FCCommonUtil colorWithHexString:@"333333"]
#define COLOR949A9E [FCCommonUtil colorWithHexString:@"949A9E"]
//屏幕宽度
#define KmainScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define KmainScreenHeight [UIScreen mainScreen].bounds.size.height
//RGB颜色
#define RGBCOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//App版本号
#define KappVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])

// 是否大于等于IOS7
#define isIOS7                  ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
// 是否IOS6
#define isIOS6                  ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0)
// 是否大于等于IOS8
#define isIOS8                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=8.0)
// 是否大于IOS9
#define isIOS9                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=9.0)
// 是否大于iOS10
#define isIOS10                 ([[[UIDevice currentDevice]systemVersion]floatValue] >=10.0)

// 是否iPad
#define isPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//弱引用/强引用
#define WS(type)  __weak typeof(type) weak##type = type;
#define SS(type)  __strong typeof(type) type = weak##type;

/**************************************************************************/

//在Main线程上运行
#define DISPATCH_ON_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//主线程上Demo
//DISPATCH_ON_MAIN_THREAD(^{
//更新UI
//})

//在Global Queue上运行
#define DISPATCH_ON_GLOBAL_QUEUE_HIGH(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_LOW(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_BACKGROUND(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), globalQueueBlocl);
//Global Queue
//DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(^{
//异步耗时任务
//})











//#define  StatusBarHeight                 20.0
//#define  NavigationBarHeight             44.0
//#define  TabBarHeight                    49.0
#define  ScreenWidth                    ([UIScreen mainScreen].bounds.size.width)
#define  ScreenHeight                   ([UIScreen mainScreen].bounds.size.height)
//#define  DefaultCellHeight               44.0
//#define  DefaultSectionHeight            0.01
//#define  DefaultMargin                   15.0
//#define  TIMGroup_DrInfoKey             @"TIMGroup_DrInfoKey"
//
//#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)
//
//#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)
//
//#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,1136), [[UIScreen mainScreen] currentMode].size) : NO)
//
//#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,960), [[UIScreen mainScreen] currentMode].size) : NO)
//// 颜色定义
//#define DEFAULT_BACKGROUND_COLOR [UIColor colorWithRed:0xf5/255.0 green:0xf5/255.0 blue:0xf5/255.0 alpha:1.0]
//#define DEFAULT_LINE_COLOR [UIColor colorWithRed:0xE5/255.0 green:0xE5/255.0 blue:0xE5/255.0 alpha:1.0]
//#define DEFAULT_BLACK_TEXT_COLOR [UIColor colorWithRed:0x33/255.0 green:0x33/255.0 blue:0x33/255.0 alpha:1.0]
#define DEFAULT_BLUE_COLOR [UIColor colorWithRed:51/255.0 green:132/255.0 blue:214/255.0 alpha:1.0]
//#define DEFAULT_GRAY_TEXT_COLOR [UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1.0]
#define LIGHT_GRAY_TEXT_COLOR [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1.0]
//#define GRAY_BODER_COLOR [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0]
//#define WARN_RED_COLOR [UIColor colorWithRed:0xed/255.0 green:0x5e/255.0 blue:0x5e/255.0 alpha:1.0]
//#define ORANGE_COLOR [UIColor colorWithRed:0xf5/255.0 green:0xb0/255.0 blue:0x15/255.0 alpha:1.0]
//#define DEFAULT_BUTTON_UNENABLE_COLOR [UIColor colorWithRed:0xcc/255.0 green:0xcc/255.0 blue:0xcc/255.0 alpha:1.0]
////textField.placeholder颜色
//#define PLACEHOLDER_TEXT_COLOR [UIColor colorWithRed:0xc7/255.0 green:0xc7/255.0 blue:0xcc/255.0 alpha:1.0]
//
//#define CARD_COLOR_GREEN [UIColor colorWithRed:0x8c/255.0 green:0xd1/255.0 blue:0x49/255.0 alpha:1.0]
//
//#define CARD_COLOR_BLUE [UIColor colorWithRed:0x4b/255.0 green:0xa1/255.0 blue:0xff/255.0 alpha:1.0]
//
//#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
//#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
//
//#define APPDELEGATE_FCPViewDidAppearNotification @"APPDELEGATE_FCPViewDidAppearNotification"
//









#define BUTTON_WIDTH (ScreenWidth - 90) / 3
#define BUTTON_HEIGHT 36

#define UIColorFromRGBA(r, g, b , a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define BG_CELL UIColorFromRGBA(250, 250, 250, 1.0)

#define currentCity (@"currentCity")

#endif /* FCMacros_h */
