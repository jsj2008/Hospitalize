//
//  ForgetPassWordViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ForgetPassWordViewController.h"
#import "ChangePwdViewController.h"
#import "RegularUtil.h"
#import "FCAlertLabel.h"

@interface ForgetPassWordViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation ForgetPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.phoneTextField.delegate = self;
}
- (IBAction)confirmAction:(id)sender {
    [self.view endEditing:YES];
    if ([FCCommonUtil isEmpty:self.phoneTextField.text]) {
        [[FCAlertLabel sharedAlertLabel]showAlertLabelWithAlertString:@"请输入电话号码"];
        return;
    }
    //判断是否是电话号码
    if ([RegularUtil isTelephone:self.phoneTextField.text]) {
        ChangePwdViewController *change = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"ChangePwdViewController"];
        [self.navigationController pushViewController:change animated:YES];
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
