//
//  AttendanceCardViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "AttendanceCardViewController.h"

@interface AttendanceCardViewController ()


@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *attendanceCard;
@property (weak, nonatomic) IBOutlet UILabel *attendanceCardNumber;
@property (weak, nonatomic) IBOutlet UIImageView *barCode;
@property (weak, nonatomic) IBOutlet UILabel *barCodeNumber;
@property (weak, nonatomic) IBOutlet UILabel *setMainCard;
@property (weak, nonatomic) IBOutlet UISwitch *setMainCardSwitch;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;




@end

@implementation AttendanceCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"就诊卡";
    self.view.backgroundColor = COLOR4B89DC;
    
    NSString *text = [NSString stringWithFormat:@"韩梅梅在杭州市第一人民医院的实体卡"];
    NSDictionary *attribs = @{NSForegroundColorAttributeName:self.titleName.textColor,NSFontAttributeName:self.titleName.font};
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithString:text
                                           attributes:attribs];
    UIColor *aColor = COLOR4B89DC;
    NSRange redTextRange =[text rangeOfString:[NSString stringWithFormat:@"韩梅梅" ]];
    [attributedText setAttributes:@{NSForegroundColorAttributeName:aColor,NSFontAttributeName:[UIFont systemFontOfSize:16]} range:redTextRange];
    self.titleName.attributedText = attributedText;
    
    
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
