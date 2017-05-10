//
//  PersonalMemberViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//  家庭成员列表

#import "PersonalMemberViewController.h"
#import "PersonInformationViewController.h"
#import "MemberTableViewCell.h"

@interface PersonalMemberViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation PersonalMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 115;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MemberTableViewCell" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PersonInformationViewController *personInformation = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"PersonInformationViewController"];
    [self.navigationController pushViewController:personInformation animated:YES];
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
