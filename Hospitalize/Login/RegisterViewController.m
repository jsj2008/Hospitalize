//
//  RegisterViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterWithPasswordViewController.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UIButton *getVerificationCodeButton;
@property (weak, nonatomic) IBOutlet UIView *promptingMessageView;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    self.promptingMessageView.hidden = YES;
    
    [self.getVerificationCodeButton addTarget:self action:@selector(getVerificationCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

//获取验证码
-(void)getVerificationCodeAction:(id)sender{
    RegisterWithPasswordViewController *registerWithPasswordViewController = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"RegisterWithPasswordViewController"];
    [self.navigationController pushViewController:registerWithPasswordViewController animated:YES];
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
