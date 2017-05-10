//
//  InspectionReportViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//   检验报告单

#import "InspectionReportViewController.h"
#import "InspectionReportProjectTableViewCell.h"
#import "InspectionReportInformationTableViewCell.h"
#import "InspectionReportPersonTableViewCell.h"
#import "ReportCategoryTableViewCell.h"
#import "FCMacros.h"

@interface InspectionReportViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation InspectionReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"检验报告单";
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 86;
    }  else if (indexPath.row == 1){
        return 207;
    }  else if (indexPath.row == 2){
        return 102;
    }  else if (indexPath.row == 3){
        return 50;
    }  else if (indexPath.row == 4){
        return 165;
    }
    return 0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row  == 0) {
        InspectionReportProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InspectionReportProjectTableViewCell" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 3){
        ReportCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReportCategoryTableViewCell" forIndexPath:indexPath];
        cell.projectContent.textColor = COLOR949A9E;
        cell.resultLabel.textColor = COLOR333333;
        return cell;
    } else if (indexPath.row == 4){
        InspectionReportPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InspectionReportPersonTableViewCell" forIndexPath:indexPath];
        return cell;
    }
    InspectionReportInformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InspectionReportInformationTableViewCell" forIndexPath:indexPath];
    if (indexPath.row == 1) {
        cell.content.hidden = YES;
        cell.contentImage.hidden = NO;
    } else {
        cell.content.hidden = NO;
        cell.contentImage.hidden = YES;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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


@end
