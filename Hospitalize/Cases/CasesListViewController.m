//
//  CasesListViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//  就诊单

#import "CasesListViewController.h"
#import "CasesListCardTableViewCell.h"
#import "CasesListOrderTableViewCell.h"
#import "CasesListSectionTableViewCell.h"
#import "CasesListRecipeTableViewCell.h"
#import "CasesListReportTableViewCell.h"
#import "BackNumberInstructionsViewController.h"
#import "FCAlertAction.h"


#import "InspectionReportViewController.h"

@interface CasesListViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end

@implementation CasesListViewController{
    UITableView *_typeTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.tableFooterView = [UIView new];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shuoming"] style:UIBarButtonItemStylePlain target:self action:@selector(illusAction)];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0://card
            return 248;
            break;
        case 1://挂号
            return 279;
            break;
        case 2://检查报告section
            return 40;
            break;
        case 3://检查报告
            return 148;
            break;
        case 4://我的处方section
            return 40;
            break;
        default://我的处方
            return 112+30*3;
            break;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.row ==0) {//card
        CasesListCardTableViewCell *cardCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListCardTableViewCell"];
        return cardCell;
    }else if (indexPath.row ==1){//挂号
        CasesListOrderTableViewCell *orderCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListOrderTableViewCell"];
        [orderCell.checkinButton addTarget:self action:@selector(checkInAction:) forControlEvents:UIControlEventTouchUpInside];
        return orderCell;
    }else if (indexPath.row ==2){//检查报告section
        CasesListSectionTableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListSectionTableViewCell"];
        sectionCell.sectionNameLabel.text = @"检查报告";
        return sectionCell;
    }else if (indexPath.row ==3){//检查报告
        CasesListReportTableViewCell *reportCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListReportTableViewCell"];
        WS(self)
        [reportCell selectBlock:^(int row) {
            [weakself pushInspectionReportView];
            }];
        
        return reportCell;
    }else if(indexPath.row ==4){//我的处方section
        CasesListSectionTableViewCell *sectionCell1 = [tableView dequeueReusableCellWithIdentifier:@"CasesListSectionTableViewCell"];
        sectionCell1.sectionNameLabel.text = @"我的处方";
        return sectionCell1;

    }else{//我的处方
        CasesListRecipeTableViewCell *recipeCell = [tableView dequeueReusableCellWithIdentifier:@"CasesListRecipeTableViewCell"];
        return recipeCell;
    }

    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isKindOfClass:[_typeTableView class]]) {
       
    }
}
//跳转到InspectionReport页面
- (void)pushInspectionReportView{
    InspectionReportViewController *ins = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"InspectionReportViewController"];
    [self.navigationController pushViewController:ins animated:YES];

}
//右上角说明按钮
- (void)illusAction{
    BackNumberInstructionsViewController *backNumberInstructions = [ViewControllerUtil getViewControllerFromCasesStoryboardWithIdentifier:@"BackNumberInstructionsViewController"];
    [self.navigationController pushViewController:backNumberInstructions animated:YES];
    
}
//签到
- (void)checkInAction:(id)sender {
    [FCAlertAction showAlertWithTitle:nil msg:@"为了避免过号，请确定您已经到达医院，点击候诊签到您将进入候诊排队队列" buttonsStatement:@[@"取消",@"确定"] chooseBlock:^(NSInteger buttonIdx) {
        if (buttonIdx ==1) {
            //确定
            UIButton *button = sender;
            button.selected = !button.selected;
        }
    }];
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
