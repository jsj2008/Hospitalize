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


#endif /* FCMacros_h */
