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
#import <NioxCore/NioxCore.h>

@interface RegisterViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;//号码输入框
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;//提示信息
@property (weak, nonatomic) IBOutlet UIButton *getVerificationCodeButton;//获取验证码按钮


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    
    self.telephoneTextField.delegate = self;
    [self.getVerificationCodeButton addTarget:self action:@selector(getVerificationCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.telephoneTextField becomeFirstResponder];
}


-(void)getVerificationCodeAction:(id)sender{
    RegisterWithPasswordViewController *registerWithPasswordViewController = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"RegisterWithPasswordViewController"];
    [self.navigationController pushViewController:registerWithPasswordViewController animated:YES];

    //判断是否是电话号码
    if ([RegularUtil isTelephone:self.telephoneTextField.text]) {
        WS(self)
        [AMAUserCenterAPI reqAuthCode:self.telephoneTextField.text reqMode:1 sendType:0 success:^(NXTFReqAuthCodeResp *model) {
            SS(self)
            if (model.status == 0) {
                [NXLogin sharedNXLogin].phoneNo = self.telephoneTextField.text;
                RegisterWithPasswordViewController *registerWithPasswordViewController = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"RegisterWithPasswordViewController"];
                [self.navigationController pushViewController:registerWithPasswordViewController animated:YES];
            }else{
                [[FCAlertLabel sharedAlertLabel] showAlertLabelWithAlertString:model.msg];
            }
            
        } failure:^(NSError *error) {
            [[FCAlertLabel sharedAlertLabel] showAlertLabelWithAlertString:error.domain];
        }];
    }else{
        [[FCAlertLabel sharedAlertLabel]showAlertLabelWithAlertString:@"请输入正确的电话号码"];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //限制电话号码输入长度
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (toBeString.length > 11 && range.length!=1){
        textField.text = [toBeString substringToIndex:11];
        return NO;
    }
    
    if (toBeString.length ==11){
        self.getVerificationCodeButton.backgroundColor = COLORFC7845;
        self.getVerificationCodeButton.userInteractionEnabled = YES;
    }else{
       self.getVerificationCodeButton.backgroundColor = COLOR949A9E;
        self.getVerificationCodeButton.userInteractionEnabled = NO;
    }
    
    return YES;
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
