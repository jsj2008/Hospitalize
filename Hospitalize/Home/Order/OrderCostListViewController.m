//
//  OrderCostListViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderCostListViewController.h"
#import "OrderCostListTableViewCell.h"
#import "OrderCostLsitHeaderView.h"

@interface OrderCostListViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *headView;

@end

@implementation OrderCostListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderCostListTableViewCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"OrderCostListTableViewCell" forIndexPath:indexPath];
    return listCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    OrderCostLsitHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderCostLsitHeaderView"];
    if (!headView) {
        headView = [[OrderCostLsitHeaderView alloc]initWithReuseIdentifier:@"OrderCostLsitHeaderView"];
        
    }
    return headView;
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
