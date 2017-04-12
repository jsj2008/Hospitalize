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

@end
