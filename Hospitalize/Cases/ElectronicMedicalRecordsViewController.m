//
//  ElectronicMedicalRecordsViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ElectronicMedicalRecordsViewController.h"
#import "MedicalRecordsPersonTableViewCell.h"
#import "MedicalRecordsContentTableViewCell.h"
#import "MedicalRecordsReportTableViewCell.h"
#import "MedicalRecordsDrugTableViewCell.h"
#import "CostViewController.h"
#import "InspectionReportViewController.h"
#import <NioxCore/NioxCore.h>

@interface ElectronicMedicalRecordsViewController ()<UITableViewDelegate, UITableViewDataSource>{
    BOOL isOPenState;//内容打开状态
}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end

@implementation ElectronicMedicalRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"病例";
    isOPenState = NO;
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.allowsSelection = NO;
    [self setExtraCellLineHidden:self.mainTableView];
    
    
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 170;

    } else if (indexPath.row == 1){
        if (isOPenState) {
           return 81;
        }
        return 81;

    } else if (indexPath.row == 2){
        return 105;

    } else if (indexPath.row == 3){
        return 66;

    } else if (indexPath.row == 4){
        return 188;

    } else if (indexPath.row == 5){
        return 69;
        
    }
    return 0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MedicalRecordsPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MedicalRecordsPersonTableViewCell" forIndexPath:indexPath];
        [cell.sumCostButton addTarget:self action:@selector(openSumCostListAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else if (indexPath.row == 1){
        MedicalRecordsContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MedicalRecordsContentTableViewCell" forIndexPath:indexPath];
        if (isOPenState) {
            cell.content.numberOfLines = 0;
        } else {
            cell.content.numberOfLines = 1;
        }
        cell.stateButton.hidden = NO;
        [cell.stateButton addTarget:self action:@selector(openContentAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else if (indexPath.row == 2){
        MedicalRecordsReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MedicalRecordsReportTableViewCell" forIndexPath:indexPath];
        [cell.reportButton addTarget:self action:@selector(openReportAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else if (indexPath.row == 3){
        MedicalRecordsContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MedicalRecordsContentTableViewCell" forIndexPath:indexPath];
        cell.stateButton.hidden = YES;
        return cell;
    } else if (indexPath.row == 4){
        MedicalRecordsDrugTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MedicalRecordsDrugTableViewCell" forIndexPath:indexPath];
        [self setLabelSpace:cell.drugContent withValue:[NSString stringWithFormat:@"%@\n%@\n%@", @"西药：西沙必利 德诺", @"中药：三九胃泰", @"注射头孢"] withFont:[UIFont systemFontOfSize:12]];
        return cell;
    } else if (indexPath.row == 5){
        MedicalRecordsContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MedicalRecordsContentTableViewCell" forIndexPath:indexPath];
        cell.stateButton.hidden = YES;
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

// 总费用事件
-(void)openSumCostListAction:(id)sender{
    CostViewController *costViewController = [ViewControllerUtil getViewControllerFromCasesStoryboardWithIdentifier:@"CostViewController"];
    [self.navigationController pushViewController:costViewController animated:YES];
}

//内容
-(void)openContentAction:(UIButton *)button{
    if (isOPenState) {
        isOPenState = NO;
        [button setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
    } else {
        isOPenState = YES;
        [button setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateNormal];
    }
    [self.mainTableView reloadData];
}
//打开报告详情事件
-(void)openReportAction:(id)sender{
    InspectionReportViewController *inspectionReport = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"InspectionReportViewController"];
    [self.navigationController pushViewController:inspectionReport animated:YES];
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

-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 5; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
    
}



@end
