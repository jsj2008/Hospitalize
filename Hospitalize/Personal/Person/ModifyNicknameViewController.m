//
//  ModifyNicknameViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//  修改昵称

#import "ModifyNicknameViewController.h"

@interface ModifyNicknameViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nickName;


@end

@implementation ModifyNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"修改昵称";
    [self.nickName becomeFirstResponder];
}

//确认修改
- (IBAction)confirmChangeAction:(id)sender {
    
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
