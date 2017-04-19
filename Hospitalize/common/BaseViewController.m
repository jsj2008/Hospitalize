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
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;


    
    self.navigationController.navigationBar.barTintColor = [FCCommonUtil colorWithHexString:@"4b89dc"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
