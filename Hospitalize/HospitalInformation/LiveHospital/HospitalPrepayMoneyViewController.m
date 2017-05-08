//
//  HospitalPrepayMoneyViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/21.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalPrepayMoneyViewController.h"
#import "PrepayMoneyTableViewCell.h"
#import "HospitalLiveInViewController.h"

@interface HospitalPrepayMoneyViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation HospitalPrepayMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 157;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PrepayMoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrepayMoneyTableViewCell" forIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HospitalLiveInViewController *livein = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalLiveInViewController"];
    [self.navigationController pushViewController:livein animated:YES];
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
