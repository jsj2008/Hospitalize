//
//  ReportListViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//  报告列表

#import "ReportListViewController.h"
#import "ReportListTableViewCell.h"
#import "FCMacros.h"
#import "InspectionReportViewController.h"
#import "SelectTableViewCell.h"

@interface ReportListViewController ()<UITableViewDataSource, UITableViewDelegate>{
    UIButton *selectButton;
    NSArray *timeArray;
    NSArray *typeArray;
    NSArray *stateArray;
}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *notResultsView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *timeImageView;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;
@property (weak, nonatomic) IBOutlet UIButton *typeButton;

@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;
@property (weak, nonatomic) IBOutlet UIButton *stateButton;
@property (weak, nonatomic) IBOutlet UITableView *selectTableView;

@end

@implementation ReportListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    timeArray = @[@"一周内",@"一月内",@"半年内",@"一年内"];
    typeArray = @[@"影像学报告",@"检验报告",@"类型不限"];
    stateArray = @[@"未出",@"已出",@"状态不限"];
    self.navigationItem.title = @"我的报告单";
    selectButton = nil;
    self.timeLabel.text = @"一周内";
    self.typeLabel.text = @"类型不限";
    self.stateLabel.text = @"状态不限";
    
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
    self.selectTableView.delegate = self;
    self.selectTableView.dataSource = self;
    [self setExtraCellLineHidden:self.selectTableView];
    [self.selectTableView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.6]];
    
    self.selectTableView.hidden = YES;
    self.notResultsView.hidden = YES;
    
    [self.timeButton addTarget:self action:@selector(selectTimeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.typeButton addTarget:self action:@selector(selectTypeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.stateButton addTarget:self action:@selector(selectStateAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)reloadImageView{
    [self.timeImageView setImage:[UIImage imageNamed:@"order_down"]];
    [self.typeImageView setImage:[UIImage imageNamed:@"order_down"]];
    [self.stateImageView setImage:[UIImage imageNamed:@"order_down"]];
}

//选择时间
-(void)selectTimeAction:(UIButton *)button{
    [self reloadImageView];
    if (selectButton == self.timeButton) {
        [self.timeImageView setImage:[UIImage imageNamed:@"order_down"]];
        self.selectTableView.hidden = YES;
        selectButton = nil;
        return;
    }
    [self.timeImageView setImage:[UIImage imageNamed:@"order_up"]];
    self.selectTableView.hidden = NO;
    selectButton = self.timeButton;
    [self.selectTableView reloadData];
    
}
//选择类型
-(void)selectTypeAction:(UIButton *)button{
    [self reloadImageView];
    if (selectButton == self.typeButton) {
        [self.typeImageView setImage:[UIImage imageNamed:@"order_down"]];
        self.selectTableView.hidden = YES;
        selectButton = nil;
        return;
    }
    [self.typeImageView setImage:[UIImage imageNamed:@"order_up"]];
    self.selectTableView.hidden = NO;
    selectButton = self.typeButton;
    [self.selectTableView reloadData];
}
//选择状态
-(void)selectStateAction:(UIButton *)button{
    [self reloadImageView];
    if (selectButton == self.stateButton) {
        [self.stateImageView setImage:[UIImage imageNamed:@"order_down"]];
        self.selectTableView.hidden = YES;
        selectButton = nil;
        return;
    }
    [self.stateImageView setImage:[UIImage imageNamed:@"order_up"]];
    self.selectTableView.hidden = NO;
    selectButton = self.stateButton;
    [self.selectTableView reloadData];
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.mainTableView) {
        return 77;
    }
    return 42;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) {
        return 6;
    } else {
        if (selectButton == self.timeButton) {
            return [timeArray count];
        } else if (selectButton == self.typeButton) {
            return [typeArray count];
        }  else if (selectButton == self.stateButton) {
            return [stateArray count];
        }
    }
    return 0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mainTableView) {
        ReportListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReportListTableViewCell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            //箭头
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.stateRightConstraint.constant = 0;
            cell.stateLabel.textColor = COLOR4B89DC;
            cell.stateLabel.text = @"已出";
        } else {
            //无箭头
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.stateRightConstraint.constant = 35;
            cell.stateLabel.textColor = COLOR949A9E;
            cell.stateLabel.text = @"未出";
        }
        return cell;
    }
    SelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectTableViewCell" forIndexPath:indexPath];
    cell.alpha = 1;
    if (selectButton == self.timeButton) {
        NSString *timeString = [timeArray objectAtIndex:indexPath.row];
        if ([self.timeLabel.text isEqualToString:timeString]) {
            cell.content.textColor = COLORFC7845;
        } else {
            cell.content.textColor = COLOR666666;
        }
        cell.content.text = timeString;
    } else if (selectButton == self.typeButton) {
        NSString *typeString = [typeArray objectAtIndex:indexPath.row];
        if ([self.typeLabel.text isEqualToString:typeString]) {
            cell.content.textColor = COLORFC7845;
        } else {
            cell.content.textColor = COLOR666666;
        }
        cell.content.text = typeString;
    } else if (selectButton == self.stateButton) {
        NSString *stateString = [stateArray objectAtIndex:indexPath.row];
        if ([self.stateLabel.text isEqualToString:stateString]) {
            cell.content.textColor = COLORFC7845;
        } else {
            cell.content.textColor = COLOR666666;
        }
        cell.content.text = stateString;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.mainTableView) {
        InspectionReportViewController *inspectionReport = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"InspectionReportViewController"];
        [self.navigationController pushViewController:inspectionReport animated:YES];
    } else {
        self.selectTableView.hidden = YES;
        if (selectButton == self.timeButton) {
            self.timeLabel.text = [timeArray objectAtIndex:indexPath.row];
            [self selectTimeAction:self.timeButton];
        } else if (selectButton == self.typeButton) {
            self.typeLabel.text = [typeArray objectAtIndex:indexPath.row];
            [self selectTypeAction:self.typeButton];
        } else if (selectButton == self.stateButton) {
            self.stateLabel.text = [stateArray objectAtIndex:indexPath.row];
            [self selectStateAction:self.stateButton];
        }
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

@end
