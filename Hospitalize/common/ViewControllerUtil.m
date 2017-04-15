//
//  ViewControllerUtil.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ViewControllerUtil.h"

@interface ViewControllerUtil ()

@end

@implementation ViewControllerUtil

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  从Home.Storyboard获取视图对象。
 *
 *  @param identifier 视图对象ID
 *  @return 视图对象
 */
+ (id) getViewControllerFromHomeStoryboardWithIdentifier:(NSString *) identifier {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    return [mainStoryboard instantiateViewControllerWithIdentifier:identifier];
}

/**
 *  从Login.Storyboard获取视图对象。
 *
 *  @param identifier 视图对象ID
 *  @return 视图对象
 */
+ (id) getViewControllerFromLoginStoryboardWithIdentifier:(NSString *) identifier {
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    return [loginStoryboard instantiateViewControllerWithIdentifier:identifier];
}


/**
 *  从Hospital.Storyboard获取视图对象。
 *
 *  @param identifier 视图对象ID
 *  @return 视图对象
 */
+ (id) getViewControllerFromHospitalStoryboardWithIdentifier:(NSString *) identifier {
    UIStoryboard *hospitalStoryboard = [UIStoryboard storyboardWithName:@"Hospital" bundle:nil];
    return [hospitalStoryboard instantiateViewControllerWithIdentifier:identifier];
}


@end
