//
//  OrderViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewCell.h"
#import "OrderRankView.h"
#import "OrderScreenView.h"
#import "ViewControllerUtil.h"
#import "PayTableViewController.h"
#import "OrderMessageViewController.h"


@interface OrderViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) OrderRankView  *orderRankView;//排序视图
@property (strong, nonatomic) OrderScreenView *orderScreenView;//筛选视图
@property (weak, nonatomic) IBOutlet UIButton *rankButton;//排序按钮
@property (weak, nonatomic) IBOutlet UIButton *screenButton;//筛选按钮

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationController.navigationBar.hidden = YES;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    // 排序
    self.orderRankView = [[OrderRankView alloc] initWithStartY:42];
    [self.view addSubview:self.orderRankView];
    //筛选
    self.orderScreenView = [[OrderScreenView alloc] initWithStartY:42];
    [self.view addSubview:self.orderScreenView];
    
    [self.rankButton setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
    [self.rankButton setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateSelected];
    self.rankButton.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,-80);
    self.rankButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    [self.screenButton setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
    [self.screenButton setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateSelected];
    self.screenButton.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,-80);
    self.screenButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderTableViewCell" forIndexPath:indexPath];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    PayTableViewController *pay = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"PayTableViewController"];
//    [self.navigationController pushViewController:pay animated:YES];
//    OrderMessageTableViewController *message = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"OrderMessageTableViewController"];
//    [self.navigationController pushViewController:message animated:YES];
    OrderMessageViewController *message = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"OrderMessageViewController"];
    [self.navigationController pushViewController: message animated:YES];

}
//排序
- (IBAction)paixuAction:(id)sender {
    UIButton *button = sender;
    button.selected  = !button.selected;
    if (self.screenButton.selected) {
        self.screenButton.selected = !self.screenButton.selected;
    }
    if (self.orderScreenView.show) {
       [self.orderScreenView orderScreen];
    }
    [self.orderRankView orderRank];
}
//筛选
- (IBAction)saixuanAction:(id)sender {
    UIButton *button = sender;
    button.selected  = !button.selected;
    if (self.rankButton.selected) {
        self.rankButton.selected = !self.rankButton.selected;
    }
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
