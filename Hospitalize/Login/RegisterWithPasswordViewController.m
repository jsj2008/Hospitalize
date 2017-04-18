//
//  RegisterWithPasswordViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "RegisterWithPasswordViewController.h"

@interface RegisterWithPasswordViewController (){
    NSTimer *_timer;//倒计时计时器
    NSInteger _secondCount;//倒计时秒
}

@property (weak, nonatomic) IBOutlet UILabel *telephoneMessageLabel;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *getVerificationCodeButton;
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
    self.getVerificationCodeButton.selected = YES;
    self.getVerificationCodeButton.userInteractionEnabled = NO;
    _secondCount = 60;
    
    [self.getVerificationCodeButton addTarget:self action:@selector(resendVerificationCodeAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self countTime];
}
-(void)countTime{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(timerCountMethod)
                                            userInfo:nil
                                             repeats:YES];
    
}

-(void)timerCountMethod{
    _secondCount --;
    NSString *str = [NSString stringWithFormat:@"重新发送(%d)",(int)_secondCount];
    [self.getVerificationCodeButton setTitle:str forState:UIControlStateSelected];
    if (_secondCount ==0) {
        [_timer invalidate];
        self.getVerificationCodeButton.selected = NO;
        self.getVerificationCodeButton.userInteractionEnabled = YES;
        self.getVerificationCodeButton.tintColor = COLOR4B89DC;
        [self.getVerificationCodeButton setTitle:@"重新发送" forState:UIControlStateNormal];
        [self.getVerificationCodeButton setTitle:@"重新发送(60)" forState:UIControlStateSelected];
    }
}

//重新发送按钮
- (void)resendVerificationCodeAction:(id)sender {
    UIButton *button = sender;
    if (self.getVerificationCodeButton.selected) {
        return;
    }else{
        _secondCount = 60;
        [self countTime];
        //do
    }
    
    button.selected = !button.selected;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
