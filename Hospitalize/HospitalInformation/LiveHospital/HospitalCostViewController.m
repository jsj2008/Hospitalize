//
//  HospitalCostViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/24.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalCostViewController.h"
#import "CostHeaderTableViewCell.h"
#import "HospitalCostSumTableViewCell.h"

@interface HospitalCostViewController ()<UITableViewDelegate, UITableViewDataSource>{
    int number;
}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;



@end

@implementation HospitalCostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"每日明细";
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
    self.mainTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KmainScreenWidth, 36)];
    self.mainTableView.tableHeaderView.backgroundColor = [UIColor clearColor];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KmainScreenWidth, 36)];
    title.textColor= COLOR949A9E;
    title.backgroundColor = [UIColor clearColor];
    title.textAlignment = YES;
    title.text = @"2016.08.30";
    title.font = [UIFont systemFontOfSize:12];
    [self.mainTableView.tableHeaderView addSubview:title];
    
    
    
    self.mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KmainScreenWidth, 24)];
    self.mainTableView.tableFooterView.backgroundColor = [UIColor clearColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, KmainScreenWidth, 30)];
    titleLabel.textColor= COLOR666666;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = YES;
    titleLabel.text = @"仅供参考，实际费用以医院明细为准";
    titleLabel.font = [UIFont systemFontOfSize:12];
    [self.mainTableView.tableFooterView addSubview:titleLabel];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        return 200;
    }
    return 50 + number * 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        HospitalCostSumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalCostSumTableViewCell" forIndexPath:indexPath];
        return cell;
    }
    
    
    CostHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CostHeaderTableViewCell" forIndexPath:indexPath];
    cell.number = number;
    [cell reloadCell];
    cell.button.tag = indexPath.row + 100;
    [cell.button addTarget:self action:@selector(openInformation:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

-(void)openInformation:(UIButton *)button{
    number = 5;
    NSIndexPath *index = [NSIndexPath indexPathForRow:button.tag - 100 inSection:0];
    [self.mainTableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
