//
//  HospitalSummryViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/21.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalSummryViewController.h"
#import "SummryHeadTableViewCell.h"
#import "SummryMianTableViewCell.h"

@interface HospitalSummryViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation HospitalSummryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 86;
    }else{
        return 100;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        SummryHeadTableViewCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"SummryHeadTableViewCell" forIndexPath:indexPath];
        return headCell;
    }else{
        SummryMianTableViewCell *mainCell = [tableView dequeueReusableCellWithIdentifier:@"SummryMianTableViewCell"forIndexPath:indexPath];
        return mainCell;
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
