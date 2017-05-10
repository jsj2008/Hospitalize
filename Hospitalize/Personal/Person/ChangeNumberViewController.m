//
//  ChangeNumberViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//  修改绑定手机

#import "ChangeNumberViewController.h"
#import "ChangePhoneNumViewController.h"

@interface ChangeNumberViewController ()

@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *telNumber;



@end

@implementation ChangeNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"修改绑定手机";
    
    self.password.secureTextEntry = YES;
}

//验证新号码
- (IBAction)VerifyNewNumberAction:(id)sender {
    ChangePhoneNumViewController *changePhoneNum = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"ChangePhoneNumViewController"];
    [self.navigationController pushViewController:changePhoneNum animated:YES];
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
