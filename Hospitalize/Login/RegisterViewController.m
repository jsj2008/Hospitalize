//
//  RegisterViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterWithPasswordViewController.h"
#import "RegularUtil.h"
#import "FCAlertLabel.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UIButton *getVerificationCodeButton;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    
    [self.getVerificationCodeButton addTarget:self action:@selector(getVerificationCodeAction:) forControlEvents:UIControlEventTouchUpInside];
}

//获取验证码
-(void)getVerificationCodeAction:(id)sender{
    //判断是否是电话号码
    if ([RegularUtil isTelephone:self.telephoneTextField.text]) {
        RegisterWithPasswordViewController *registerWithPasswordViewController = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"RegisterWithPasswordViewController"];
        [self.navigationController pushViewController:registerWithPasswordViewController animated:YES];
    }else{
        [[FCAlertLabel sharedAlertLabel]showAlertLabelWithAlertString:@"请输入正确的电话号码"];
    }
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
