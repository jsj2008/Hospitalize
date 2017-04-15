//
//  FCAlertLabel.h
//  AlertLabelDemo
//
//  Created by 周鑫 on 15/6/3.
//  Copyright (c) 2015年 HZTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
static CGFloat kAlertLabelTag = 100;
@interface FCAlertLabel : NSObject

/**
 *  创建AlertLabel实例
 *
 *  @return AlertLabel对象
 */
+ (instancetype)sharedAlertLabel;

/**
 *  弹出AlertLabel
 *
 *  @param alertString AlertLabel上显示的字
 */
- (void)showAlertLabelWithAlertString:(NSString *)alertString;

- (void)hideAlertLabeImmediatelyIfShowing;

@end
