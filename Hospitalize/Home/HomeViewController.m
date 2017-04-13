//
//  HomeViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeItmeTableViewCell.h"
#import "OrderViewController.h"

#import "DepartmentsListViewController.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeAnAppointmentAction:(id)sender {
    DepartmentsListViewController *departmentsListViewController = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"DepartmentsListViewController"];
    [self.navigationController pushViewController:departmentsListViewController animated:YES];
    
}
- (void)onlineConsultingAction:(id)sender {
    OrderViewController *order = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"OrderViewController"];
    [self.navigationController pushViewController:order animated:YES];
}
- (void)internetOfficeAction:(id)sender {
    
}
- (void)myCollectionAction:(id)sender {
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 118;
    }
    return 80;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        HomeItmeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeItmeTableViewCell" forIndexPath:indexPath];
        [cell.makeAnAppointmentButton addTarget:self action:@selector(makeAnAppointmentAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.onlineConsultingButton addTarget:self action:@selector(onlineConsultingAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.internetOfficeButton addTarget:self action:@selector(internetOfficeAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.myCollectionButton addTarget:self action:@selector(myCollectionAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else {
//        OrderMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderMainTableViewCell" forIndexPath:indexPath];
//        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}


@end
