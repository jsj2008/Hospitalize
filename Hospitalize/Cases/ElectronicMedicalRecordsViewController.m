//
//  ElectronicMedicalRecordsViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ElectronicMedicalRecordsViewController.h"
#import "MedicalRecordsPersonTableViewCell.h"
#import "CostViewController.h"

@interface ElectronicMedicalRecordsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end

@implementation ElectronicMedicalRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"病例";
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MedicalRecordsPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MedicalRecordsPersonTableViewCell" forIndexPath:indexPath];
    [cell.sumCostButton addTarget:self action:@selector(openSumCostListAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

// 总费用事件
-(void)openSumCostListAction:(id)sender{
    CostViewController *costViewController = [ViewControllerUtil getViewControllerFromCasesStoryboardWithIdentifier:@"CostViewController"];
    [self.navigationController pushViewController:costViewController animated:YES];
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
