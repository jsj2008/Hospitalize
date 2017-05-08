//
//  HospitalLiveInViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/24.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalLiveInViewController.h"
#import "LiveInHeadTableViewCell.h"
#import "LiveInCostListTableViewCell.h"
#import "NXInpatientFeeListViewController.h"
#import "InpatientFeeInHospitalSectionView.h"

@interface HospitalLiveInViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation HospitalLiveInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KmainScreenWidth, 30)];
    footerLabel.backgroundColor = COLOREFF3F6;
    footerLabel.text = @"仅供参考，实际费用以医院明细为准";
    footerLabel.textColor = COLOR666666;
    footerLabel.textAlignment = NSTextAlignmentCenter;
    footerLabel.font = [UIFont systemFontOfSize:12];
    self.mainTableView.tableFooterView = footerLabel;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 0;
    }else{
        return 67;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 1;
    }else{
     return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return 163;
    }else if (indexPath.section ==1){
            return 100;
    }else{
        return 0;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    InpatientFeeInHospitalSectionView *view = [[InpatientFeeInHospitalSectionView alloc]init];
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        LiveInHeadTableViewCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"LiveInHeadTableViewCell" forIndexPath:indexPath];
        return headCell;
    }else if (indexPath.section ==1){
        LiveInCostListTableViewCell *costListCell = [tableView dequeueReusableCellWithIdentifier:@"LiveInCostListTableViewCell" forIndexPath:indexPath];
        return costListCell;
    }else{
        return nil;
    }
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
