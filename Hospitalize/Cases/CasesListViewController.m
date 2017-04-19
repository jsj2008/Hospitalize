//
//  CasesListViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "CasesListViewController.h"
#import "CasesListCardTableViewCell.h"
#import "CasesListOrderTableViewCell.h"
#import "CasesListSectionTableViewCell.h"
#import "CasesListRecipeTableViewCell.h"
#import "CasesListReportTableViewCell.h"

@interface CasesListViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation CasesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.tableFooterView = [UIView new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 231;
    }else if (indexPath.row ==1){
        return 219;
    }else if (indexPath.row ==2){
        return 40;
    }else if (indexPath.row ==3){
        return 148;
    }else if (indexPath.row ==4){
        return 40;
    }else{
        return 112+30*3;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        CasesListCardTableViewCell *cardCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListCardTableViewCell"];
        return cardCell;
    }else if (indexPath.row ==1){
        CasesListOrderTableViewCell *orderCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListOrderTableViewCell"];
        return orderCell;
    }else if (indexPath.row ==2){
        CasesListSectionTableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListSectionTableViewCell"];
        sectionCell.sectionNameLabel.text = @"检查报告";
        return sectionCell;
    }else if (indexPath.row ==3){
        CasesListReportTableViewCell *reportCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListReportTableViewCell"];
        return reportCell;
    }else if(indexPath.row ==4){
        CasesListSectionTableViewCell *sectionCell1 = [tableView dequeueReusableCellWithIdentifier:@"CasesListSectionTableViewCell"];
        sectionCell1.sectionNameLabel.text = @"我的处方";
        return sectionCell1;

    }else{
        CasesListRecipeTableViewCell *recipeCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListRecipeTableViewCell"];
        return recipeCell;
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
