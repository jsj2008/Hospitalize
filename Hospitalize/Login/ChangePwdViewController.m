//
//  ChangePwdViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ChangePwdViewController.h"

@interface ChangePwdViewController (){
    NSTimer *_timer;//倒计时计时器
    NSInteger _secondCount;//倒计时秒
}

@property (weak, nonatomic) IBOutlet UIButton *reSendButton;//重新发送按钮

@end

@implementation ChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.reSendButton.selected = YES;
    self.reSendButton.userInteractionEnabled = NO;
    _secondCount = 60;
    
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
    [self.reSendButton setTitle:str forState:UIControlStateSelected];
    if (_secondCount ==0) {
        [_timer invalidate];
        self.reSendButton.selected = NO;
        self.reSendButton.userInteractionEnabled = YES;
        self.reSendButton.tintColor = COLOR4B89DC;
        [self.reSendButton setTitle:@"重新发送" forState:UIControlStateNormal];
        [self.reSendButton setTitle:@"重新发送(60)" forState:UIControlStateSelected];
    }
}

//重新发送按钮
- (IBAction)resendAction:(id)sender {
    UIButton *button = sender;
    if (self.reSendButton.selected) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
