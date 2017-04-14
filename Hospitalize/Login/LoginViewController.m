//
//  LoginViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//忘记密码
- (IBAction)forgetAction:(id)sender {
    ForgetPassWordViewController *forget = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"ForgetPassWordViewController"];
    [self.navigationController pushViewController:forget animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerAction:(id)sender {
    RegisterViewController *registerViewController = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"RegisterViewController"];
    [self.navigationController pushViewController:registerViewController animated:YES];
    
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
