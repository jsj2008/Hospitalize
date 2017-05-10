//
//  SetViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//  设置

#import "SetViewController.h"
#import "OpinionViewController.h"
#import "AboutViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//意见反馈
- (IBAction)openOpinionAction:(id)sender {
    OpinionViewController *opinion = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"OpinionViewController"];
    [self.navigationController pushViewController:opinion animated:YES];
}

//关于事件
- (IBAction)openAboutAction:(id)sender {
    AboutViewController *about = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"AboutViewController"];
    [self.navigationController pushViewController:about animated:YES];
}

//退出登录
- (IBAction)logOutAction:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
