//
//  MyHospitalRecordsViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/21.
//  Copyright © 2017年 feichang. All rights reserved.
//  住院记录列表

#import "MyHospitalRecordsViewController.h"
#import "MyHospitalRecordsTableViewCell.h"

#import "HospitalCostListViewController.h"

@interface MyHospitalRecordsViewController ()<UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *notResultView;

@end

@implementation MyHospitalRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的住院记录";
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
    self.notResultView.hidden = YES;
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 138;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyHospitalRecordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyHospitalRecordsTableViewCell" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HospitalCostListViewController *hospitalCostList = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalCostListViewController"];
    [self.navigationController pushViewController:hospitalCostList animated:YES];
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
