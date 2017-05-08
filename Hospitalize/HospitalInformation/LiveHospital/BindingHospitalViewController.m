//
//  BindingHospitalViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/21.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "BindingHospitalViewController.h"

@interface BindingHospitalViewController ()

@property (weak, nonatomic) IBOutlet UILabel *information;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;


@end

@implementation BindingHospitalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *text = [NSString stringWithFormat:@"请绑定韩梅梅在浙江省肿瘤医院的住院号"];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str setAttributes:@{NSForegroundColorAttributeName:COLOR4B89DC,NSFontAttributeName:[UIFont systemFontOfSize:16]} range:[text rangeOfString:[NSString stringWithFormat:@"韩梅梅"]]];
    [str setAttributes:@{NSForegroundColorAttributeName:COLOR4B89DC,NSFontAttributeName:[UIFont systemFontOfSize:16]} range:[text rangeOfString:[NSString stringWithFormat:@"浙江省肿瘤医院"]]];
    self.information.attributedText = str;
}

//绑定事件
- (IBAction)bindingHospitalAction:(id)sender {
    
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
