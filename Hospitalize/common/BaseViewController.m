//
//  BaseViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeViewController.h"
#import "CasesViewController.h"
#import "SeeDoctorViewController.h"
#import "MessageViewController.h"
#import "PersonalViewController.h"
#import "ClinicCardListViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self isKindOfClass:[HomeViewController class]] || [self isKindOfClass:[CasesViewController class]] || [self isKindOfClass:[SeeDoctorViewController class]] || [self isKindOfClass:[MessageViewController class]] || [self isKindOfClass:[PersonalViewController class]]) {
        self.tabBarController.tabBar.hidden = NO;
    } else {
        self.tabBarController.tabBar.hidden = YES;
    }
    
    if ([self isKindOfClass:[ClinicCardListViewController class]]) {
        //    导航栏背景设置
        [self.navigationController.navigationBar setBackgroundImage:[FCCommonUtil createImageWithColor:[[UIColor whiteColor] colorWithAlphaComponent:1]] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.translucent = YES;
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COLOR333333,NSForegroundColorAttributeName,nil]];
        self.navigationController.navigationBar.tintColor = COLOR333333;
    } else {
        self.navigationController.navigationBar.barTintColor = COLOR4B89DC;
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
        self.navigationController.navigationBar.alpha = 1;
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
