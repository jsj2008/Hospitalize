//
//  RegisterWithPasswordViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "RegisterWithPasswordViewController.h"

@interface RegisterWithPasswordViewController ()
@property (weak, nonatomic) IBOutlet UILabel *telephoneMessageLabel;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *getVerificationCodeButton;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *idNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIView *promptMessageView;
@property (weak, nonatomic) IBOutlet UIButton *knowButton;



@end

@implementation RegisterWithPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    self.promptMessageView.hidden = YES;
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
