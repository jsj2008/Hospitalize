//
//  PersonInformationViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "PersonInformationViewController.h"
#import "PersonInformationTextTableViewCell.h"
#import "PersonInformationButtonTableViewCell.h"
#import "PersonInformationNotCardTableViewCell.h"
#import "PersonInformationCardListTableViewCell.h"
#import "CardCollectionViewCell.h"
#import "CardCollectionViewFlowLayout.h"
#import "FCAlertAction.h"
#import "ClinicCardListViewController.h"
#import "OrderViewController.h"
#import "HealthRecordsViewController.h"

@interface PersonInformationViewController ()<UITableViewDelegate, UITableViewDataSource>{
    int numberAttendanceCard;//就诊卡数量
    int hospitalNumber;//住院号数量
}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation PersonInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(savePersonInformationAction:)];
    
    self.navigationItem.title = @"个人信息";
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
    
    numberAttendanceCard = 5;
    hospitalNumber = 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < 6) {
        return 50;
    } else if (indexPath.row == 6) {
        if (numberAttendanceCard == 0) {
            return 248;
        }
        return 70 + (numberAttendanceCard - 1) * 50 + 120;
    } else if (indexPath.row == 7){
        if (hospitalNumber == 0) {
            return 248;
        }
        return 70 + (hospitalNumber - 1) * 50 + 120;
    }
    return 0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        PersonInformationTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationTextTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.content.enabled = NO;
        cell.content.textColor = COLOR949A9E;
        return cell;
    } else if (indexPath.row == 1){
        PersonInformationButtonTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationButtonTableViewCell" forIndexPath:indexPath];
        cell.textContent.hidden = YES;
        cell.porImageView.hidden = NO;
        return cell;
    } else if (indexPath.row == 2){
        PersonInformationTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationTextTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleName.text = @"姓名";
        cell.content.text = @"韩梅梅";
        cell.content.enabled = NO;
        cell.content.textColor = COLOR949A9E;
        return cell;
    } else if (indexPath.row == 3){
        PersonInformationTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationTextTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleName.text = @"手机号";
        cell.content.text = @"135****0305";
        cell.content.enabled = YES;
        cell.content.textColor = COLOR333333;
        return cell;
    } else if (indexPath.row == 4){
        PersonInformationTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationTextTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleName.text = @"身份证号";
        cell.content.text = @"500381********6241";
        cell.content.enabled = NO;
        cell.content.textColor = COLOR949A9E;
        return cell;
    } else if (indexPath.row == 5){
        PersonInformationButtonTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationButtonTableViewCell" forIndexPath:indexPath];
        cell.titleName.text = @"健康档案";
        cell.textContent.text = @"完善信息";
        cell.textContent.hidden = NO;
        cell.porImageView.hidden = YES;
        return cell;
    } else if (indexPath.row == 6){
        if (numberAttendanceCard == 0) {
            PersonInformationNotCardTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationNotCardTableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.titleName.text = @"就诊卡管理";
            cell.describe.text = @"添加就诊卡进行挂号、缴费、查报告";
            cell.addType.text = @"添加就诊卡";
            return cell;
        }
        PersonInformationCardListTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationCardListTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleName.text = @"就诊卡管理";
        [cell.addButton addTarget:self action:@selector(addCardAction:) forControlEvents:UIControlEventTouchUpInside];
        cell.cellNumber = numberAttendanceCard;
        [cell cellReload];
        return cell;
        
    } else if (indexPath.row == 7){
        if (hospitalNumber == 0) {
            PersonInformationNotCardTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationNotCardTableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.titleName.text = @"住院号";
            cell.describe.text = @"添加住院号进行住院管理";
            cell.addType.text = @"添加住院号";
            return cell;
        }
        PersonInformationCardListTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInformationCardListTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.addButton addTarget:self action:@selector(addCardAction:) forControlEvents:UIControlEventTouchUpInside];
        cell.titleName.text = @"住院号";
        cell.cellNumber = hospitalNumber;
        [cell cellReload];
        return cell;
    }
    
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 1) {
        NSArray *array = @[@"拍照",@"从手机相册选择"];
        [FCAlertAction showActionSheetWithTitle:nil message:nil  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:array chooseBlock:^(NSInteger buttonIdx) {
            if (buttonIdx > 0) {
                NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"%@",array[buttonIdx - 1]];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
            }
        }];
    } else if (indexPath.row == 5){
        HealthRecordsViewController *healthRecords = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"HealthRecordsViewController"];
        [self.navigationController pushViewController:healthRecords animated:YES];
        
    }else if (indexPath.row == 6){
        if (numberAttendanceCard == 0) {
            OrderViewController *order = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"OrderViewController"];
            
            [self.navigationController pushViewController:order animated:YES];
            return;
        }
        ClinicCardListViewController *clinicCardList = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"ClinicCardListViewController"];
        [self.navigationController pushViewController:clinicCardList animated:YES];
    } else if (indexPath.row == 7){
        if (hospitalNumber == 0) {
            OrderViewController *order = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"OrderViewController"];
            
            [self.navigationController pushViewController:order animated:YES];
            return;
        }
        ClinicCardListViewController *clinicCardList = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"ClinicCardListViewController"];
        [self.navigationController pushViewController:clinicCardList animated:YES];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}
//保存信息
-(void)savePersonInformationAction:(id)sender{
    
}
//添加卡
-(void)addCardAction:(id)sender{
    OrderViewController *order = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"OrderViewController"];
    
    [self.navigationController pushViewController:order animated:YES];
}



@end
