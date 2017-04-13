//
//  OrderViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderMainTableViewCell.h"
#import "OrderRankView.h"
#import "OrderScreenView.h"
#import "ViewControllerUtil.h"
#import "PayViewController.h"

@interface OrderViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) OrderRankView  *orderRankView;
@property (strong, nonatomic) OrderScreenView *orderScreenView;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    // 筛选条件
    self.orderRankView = [[OrderRankView alloc] initWithStartY:(64+42)];
    [self.view addSubview:self.orderRankView];
    
    self.orderScreenView = [[OrderScreenView alloc] initWithStartY:(64+42)];
    [self.view addSubview:self.orderScreenView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderMainTableViewCell" forIndexPath:indexPath];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PayViewController *pay = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"PayViewController"];
    [self.navigationController pushViewController:pay animated:YES];
}
//排序
- (IBAction)paixuAction:(id)sender {
    if (self.orderScreenView.show) {
       [self.orderScreenView orderScreen];
    }
    [self.orderRankView orderRank];
}
//筛选
- (IBAction)saixuanAction:(id)sender {
    if (self.orderRankView.show) {
        [self.orderRankView orderRank];
    }
    [self.orderScreenView orderScreen];
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
