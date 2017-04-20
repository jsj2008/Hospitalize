//
//  ClinicCardListViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ClinicCardListViewController.h"
#import "ClinicCardListTableViewCell.h"
#import "AttendanceCardViewController.h"

@interface ClinicCardListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation ClinicCardListViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    导航栏背景设置
    [self.navigationController.navigationBar setBackgroundImage:[FCCommonUtil createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COLOR333333,NSForegroundColorAttributeName,nil]];
    self.navigationController.navigationBar.tintColor = COLOR333333;
    self.navigationController.navigationBar.shadowImage = nil;

    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    导航栏背景设置
    [self.navigationController.navigationBar setBackgroundImage:[FCCommonUtil createImageWithColor:COLOR4B89DC ] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tianjiakapian"] style:UIBarButtonItemStylePlain target:self action:@selector(addCardAction:)];
    
    self.navigationItem.title = @"我的就诊卡";
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    self.mainTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KmainScreenWidth, 5)];
    self.mainTableView.tableHeaderView.backgroundColor = [UIColor whiteColor];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClinicCardListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClinicCardListTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row % 2 == 0) {
        cell.bigBackgroundView.backgroundColor = COLOR85B7F9;
    } else {
        cell.bigBackgroundView.backgroundColor = COLORBDE0BC;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AttendanceCardViewController *attendanceCard = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"AttendanceCardViewController"];
    [self.navigationController pushViewController:attendanceCard animated:YES];
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

-(void)addCardAction:(id)sender{
    
}


@end
