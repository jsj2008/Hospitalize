//
//  CostViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//  病例总费用

#import "CostViewController.h"
#import "CostTableViewCell.h"

@interface CostViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *costTitleName;
@property (weak, nonatomic) IBOutlet UILabel *sumCost;

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end

@implementation CostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"总费用";
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.allowsSelection = NO;
    self.mainTableView.bounces = NO;
    [self setExtraCellLineHidden:self.mainTableView];
    self.mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KmainScreenWidth, 24)];
    self.mainTableView.tableFooterView.backgroundColor = [UIColor whiteColor];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CostTableViewCell" forIndexPath:indexPath];
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
