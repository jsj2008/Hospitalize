//
//  CasesViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "CasesViewController.h"
#import "CasesListTableViewCell.h"
#import "BackNumberInstructionsViewController.h"

@interface CasesViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation CasesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[FCCommonUtil createImageWithColor:[UIColor clearColor]]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    self.navigationItem.title = @"韩梅梅";
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        return 184;
    }
    return 156;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CasesListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CasesListTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.contentBigView.layer.shadowColor=[UIColor blackColor].CGColor;
    cell.contentBigView.layer.shadowOffset=CGSizeMake(0, 0);
    cell.contentBigView.layer.shadowOpacity=0.15;
    cell.contentBigView.layer.shadowRadius=5;
    
    if (indexPath.row % 2 == 0) {
        cell.doctorImageView.hidden = NO;
        cell.doctorName.hidden = NO;
        cell.costTopConstraint.constant = 41;
    } else {
        cell.doctorImageView.hidden = YES;
        cell.doctorName.hidden = YES;
        cell.costTopConstraint.constant = 12;
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BackNumberInstructionsViewController *backNumberInstructions = [ViewControllerUtil getViewControllerFromCasesStoryboardWithIdentifier:@"BackNumberInstructionsViewController"];
    [self.navigationController pushViewController:backNumberInstructions animated:YES];
    
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
