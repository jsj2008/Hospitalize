//
//  AttendanceCardViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "AttendanceCardViewController.h"
#import "FCAlertAction.h"

@interface AttendanceCardViewController ()

@property (weak, nonatomic) IBOutlet UIView *backgroundBigView;

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
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.backgroundBigView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(10, 10)];
    // 初始化一个CAShapeLayer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.backgroundBigView.bounds;
    // 将曲线路径设置为layer的路径
    maskLayer.path = path.CGPath;
    // 设置控件的mask为CAShapeLayer
    self.backgroundBigView.layer.mask = maskLayer;
    
    NSString *text = [NSString stringWithFormat:@"韩梅梅在杭州市第一人民医院的实体卡"];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str setAttributes:@{NSForegroundColorAttributeName:COLOR4B89DC,NSFontAttributeName:[UIFont systemFontOfSize:16]} range:[text rangeOfString:[NSString stringWithFormat:@"韩梅梅"]]];
    [str setAttributes:@{NSForegroundColorAttributeName:COLOR4B89DC,NSFontAttributeName:[UIFont systemFontOfSize:16]} range:[text rangeOfString:[NSString stringWithFormat:@"杭州市第一人民医院"]]];
    self.titleName.attributedText = str;
    
    self.setMainCardSwitch.on = self.isMainCard;
    [self.setMainCardSwitch addTarget:self action:@selector(setMainCardAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.deleteButton addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setMainCardAction:(id)sender{
    if (self.isMainCard) {
        self.isMainCard = NO;
    } else {
        self.isMainCard = YES;
    }
    self.setMainCardSwitch.on = self.isMainCard;
}

-(void)deleteAction:(id)sender{
    NSArray *array = @[@"移除"];
    [FCAlertAction showActionSheetWithTitle:nil message:@"移除此卡会移除您的就诊记录"  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:array chooseBlock:^(NSInteger buttonIdx) {
        if (buttonIdx > 0) {
            NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"%@",array[buttonIdx - 1]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    }];
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
