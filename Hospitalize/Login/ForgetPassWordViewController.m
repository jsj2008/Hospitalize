//
//  ForgetPassWordViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ForgetPassWordViewController.h"
#import "ChangePwdViewController.h"

@interface ForgetPassWordViewController ()

@end

@implementation ForgetPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)confirmAction:(id)sender {
    [self.view endEditing:YES];
    ChangePwdViewController *change = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"ChangePwdViewController"];
    [self.navigationController pushViewController:change animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
