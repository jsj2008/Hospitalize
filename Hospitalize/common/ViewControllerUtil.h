//
//  ViewControllerUtil.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerUtil : UIViewController


/**
 *  从Home.Storyboard获取视图对象。
 *
 *  @param identifier 视图对象ID
 *  @return 视图对象
 */
+ (id) getViewControllerFromHomeStoryboardWithIdentifier:(NSString *) identifier;

/**
 *  从Login.Storyboard获取视图对象。
 *
 *  @param identifier 视图对象ID
 *  @return 视图对象
 */
+ (id) getViewControllerFromLoginStoryboardWithIdentifier:(NSString *) identifier;

/**
 *  从Hospital.Storyboard获取视图对象。
 *
 *  @param identifier 视图对象ID
 *  @return 视图对象
 */
+ (id) getViewControllerFromHospitalStoryboardWithIdentifier:(NSString *) identifier;

/**
 *  从Cases.Storyboard获取视图对象。
 *
 *  @param identifier 视图对象ID
 *  @return 视图对象
 */
+ (id) getViewControllerFromCasesStoryboardWithIdentifier:(NSString *) identifier;



@end
