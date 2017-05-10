//
//  PersonalViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//  个人

#import "PersonalViewController.h"
#import "PersonalMemberViewController.h"
#import "PersonalCollectViewController.h"
#import "ReservationListViewController.h"
#import "SetViewController.h"
#import "PersonInformationReviseViewController.h"
#import "HealthRecordsViewController.h"


@interface PersonalViewController ()
//整体高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeightConstraint;
//用户头像
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;
//用户名
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
//用户电话
@property (weak, nonatomic) IBOutlet UILabel *userPhoneNumLabel;
//登陆注册
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;

@end

@implementation PersonalViewController

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.contentHeightConstraint.constant = KmainScreenHeight;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//跳转信息修改
- (IBAction)personalAction:(id)sender {
    PersonInformationReviseViewController *personInformationRevise = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"PersonInformationReviseViewController"];
    [self.navigationController pushViewController:personInformationRevise animated:YES];
}
//家庭成员
- (IBAction)menberAction:(id)sender {
    PersonalMemberViewController *member = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"PersonalMemberViewController"];
    [self.navigationController pushViewController:member animated:YES];
}
//我的预约
- (IBAction)orderAction:(id)sender {
    ReservationListViewController *reservationList = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"ReservationListViewController"];
    [self.navigationController pushViewController:reservationList animated:YES];
}
//我的咨询
- (IBAction)zixunAction:(id)sender {
}
//我的收藏
- (IBAction)shoucangAction:(id)sender {
    PersonalCollectViewController *collection = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"PersonalCollectViewController"];
    [self.navigationController pushViewController:collection animated:YES];
}
//健康档案
- (IBAction)danganAction:(id)sender {
    HealthRecordsViewController *healthRecords = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"HealthRecordsViewController"];
    [self.navigationController pushViewController:healthRecords animated:YES];
}
//设置
- (IBAction)settingAction:(id)sender {
    SetViewController *setViewController = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"SetViewController"];
    [self.navigationController pushViewController:setViewController animated:YES];
}
//联系客服
- (IBAction)kefuAction:(id)sender {
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
