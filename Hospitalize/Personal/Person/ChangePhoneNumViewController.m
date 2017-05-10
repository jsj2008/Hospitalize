//
//  ChangePhoneNumViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//  绑定手机验证

#import "ChangePhoneNumViewController.h"

@interface ChangePhoneNumViewController ()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;//提示信息
@property (weak, nonatomic) IBOutlet UIButton *resendButton;//重新发送按钮
@property (weak, nonatomic) IBOutlet UITextField *insetTetxField;//输入框


@end

@implementation ChangePhoneNumViewController{
    NSTimer *_timer;
    int _secondCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _secondCount = 60;
    self.resendButton.selected = YES;
    self.resendButton.userInteractionEnabled = NO;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self countTimeAction];
}
-(void)countTimeAction{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(timerCount)
                                            userInfo:nil
                                             repeats:YES];
    
}

-(void)timerCount{
    _secondCount --;
    NSString *str = [NSString stringWithFormat:@"重新发送(%d)",(int)_secondCount];
    [self.resendButton setTitle:str forState:UIControlStateSelected];
    if (_secondCount ==0) {
        [_timer invalidate];
        self.resendButton.selected = NO;
        self.resendButton.userInteractionEnabled = YES;
        self.resendButton.tintColor = COLOR4B89DC;
        [self.resendButton setTitle:@"重新发送" forState:UIControlStateNormal];
        [self.resendButton setTitle:@"重新发送(60)" forState:UIControlStateSelected];
    }
}
//重新发送
- (IBAction)resetAction:(id)sender {
    UIButton *button = sender;
    if (self.resendButton.selected) {
        return;
    }else{
        _secondCount = 60;
        [self countTimeAction];
        //do
    }
    
    button.selected = !button.selected;
}
//绑定
- (IBAction)bindAction:(id)sender {
   
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
