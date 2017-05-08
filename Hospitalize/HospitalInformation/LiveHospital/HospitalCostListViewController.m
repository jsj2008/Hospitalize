//
//  HospitalCostListViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/21.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalCostListViewController.h"
#import "HospitalCostListTableViewCell.h"
#import "HospitalCostViewController.h"

@interface HospitalCostListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end

@implementation HospitalCostListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"每日明细";
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    self.mainTableView.sectionHeaderHeight = 30;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init] ;
    myView.backgroundColor = COLOREFF3F6;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, KmainScreenWidth, 30)];
    titleLabel.textColor= COLOR949A9E;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"2016.07";
    titleLabel.font = [UIFont systemFontOfSize:14];
    [myView addSubview:titleLabel];
    return myView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HospitalCostListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalCostListTableViewCell" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HospitalCostViewController *hospitalCost = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalCostViewController"];
    [self.navigationController pushViewController:hospitalCost animated:YES];
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
