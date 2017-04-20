//
//  ClinicAddViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ClinicAddViewController.h"
#import "FCAlertAction.h"

@interface ClinicAddViewController ()
@property (weak, nonatomic) IBOutlet UILabel *bindMsgLabel;//绑定信息
@property (weak, nonatomic) IBOutlet UIButton *changeButton;//切换绑卡类型按钮
@property (weak, nonatomic) IBOutlet UITextField *cardNumTextField;//输入卡号输入框

@end

@implementation ClinicAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//切换绑卡类型
- (IBAction)changeAction:(id)sender {
    NSString *cardString = nil;
    if ([self.changeButton.titleLabel.text isEqualToString:@"就诊卡号"]) {
        cardString = @"病例号";
    }else if ([self.changeButton.titleLabel.text isEqualToString:@"病例号"]){
        cardString = @"就诊卡号";
    }
    [FCAlertAction showActionSheetWithTitle:nil message:@"请选择就诊卡类型" cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:@[cardString] chooseBlock:^(NSInteger buttonIdx) {
        if (buttonIdx ==1) {
            [self.changeButton setTitle:cardString forState:UIControlStateNormal];
        }
    }];

}
//绑定
- (IBAction)bindAction:(id)sender {
    
}
//申请
- (IBAction)applyAction:(id)sender {
    
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
