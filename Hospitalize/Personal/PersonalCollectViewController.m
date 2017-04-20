//
//  PersonalCollectViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "PersonalCollectViewController.h"
#import "UIView+Extension.h"
#import "CollectionDoctorTableViewCell.h"
#import "CollectionHospitalTableViewCell.h"
#import "HospitalViewController.h"
#import "DoctorViewController.h"


@interface PersonalCollectViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *collectionHospitalButton;
@property (weak, nonatomic) IBOutlet UIButton *collectionDoctorButton;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation PersonalCollectViewController{
    BOOL _isInDoctorPage;//是否是在收藏医生页
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我的收藏";
    self.collectionHospitalButton.selected = YES;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isInDoctorPage) {
        return 91;
    }else{
        return 81;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isInDoctorPage) {
        return 3;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isInDoctorPage) {
        CollectionDoctorTableViewCell *doctorCell = [tableView dequeueReusableCellWithIdentifier:@"CollectionDoctorTableViewCell" forIndexPath:indexPath];
        return doctorCell;
    }else{
        CollectionHospitalTableViewCell *hospitalCell = [tableView dequeueReusableCellWithIdentifier:@"CollectionHospitalTableViewCell" forIndexPath:indexPath];
        return hospitalCell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_isInDoctorPage) {
        DoctorViewController *doctor = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"DoctorViewController"];
        [self.navigationController pushViewController:doctor animated:YES];
    } else {
        HospitalViewController *hospitalViewController = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalViewController"];
        hospitalViewController.titleName = @"浙江省医院";
        [self.navigationController pushViewController:hospitalViewController animated:YES];
    }
}

// 自定义左滑显示编辑按钮.IOS8以上
-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    rowAction.backgroundColor = COLORFC7845;
    NSArray *arr = @[rowAction];
    return arr;
}

//收藏医院
- (IBAction)hospitalAction:(id)sender {
    self.collectionHospitalButton.selected = YES;
        self.collectionDoctorButton.selected = NO;
    UIButton *button = sender;
    [self bottomViewAnimation:button];
    
    _isInDoctorPage = NO;
    [self.mainTableView reloadData];
}
//收藏医生
- (IBAction)doctorAction:(id)sender {
    self.collectionDoctorButton.selected = YES;
        self.collectionHospitalButton.selected = NO;
    UIButton *button = sender;
    [self bottomViewAnimation:button];
    
    _isInDoctorPage = YES;
    [self.mainTableView reloadData];
}

-(void)bottomViewAnimation:(UIButton *)button{
    [UIView animateWithDuration:0.2 animations:^{
        self.bottomView.centerX = button.centerX;
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
