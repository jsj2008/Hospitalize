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


@end
