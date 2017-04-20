//
//  DoctorViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "DoctorViewController.h"
#import "DoctorHeadTableViewCell.h"
#import "DoctorMajorTableViewCell.h"
#import "DoctorFucTableViewCell.h"
#import "DoctorIntroTableViewCell.h"
#import "DoctorStarTableViewCell.h"
#import "DoctorSectionTableViewCell.h"
#import "PatientsEvaluationViewController.h"

@interface DoctorViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation DoctorViewController{
    BOOL _majorRowisOpen;//记录主治方向行是否完全展开
    BOOL _introRowisOpen;//记录简介是否完全展开
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    _majorRowisOpen = NO;
    _introRowisOpen = NO;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 222;
    }else if (indexPath.row ==1){
        NSString *str = @"胃肠疾病、消化道肿瘤及肝胆胰疾病的诊治，胃镜、肠镜、ERCP、EST的诊断和治疗。胃肠疾病、消化道肿瘤及肝胆胰疾病的诊治，胃镜、肠镜、ERCP、EST的诊断和治疗。胃肠疾病、消化道肿瘤及肝胆胰疾病的诊治，胃镜、肠镜、E";
      CGSize size = [FCCommonUtil sizeWithString:str font:[UIFont systemFontOfSize:14.0] ContentMaxSize:CGSizeMake(KmainScreenWidth-30, 1000)];
        
        if (_majorRowisOpen) {//展开
            CGFloat rowHight = 0;
            if (104+size.height<128) {
                rowHight = 128;
            }else{
                rowHight = 104+size.height;
            }
            return rowHight;
        }else{
         return 128;
        }
        
    }else if (indexPath.row ==2){
        return 137;
    }else if (indexPath.row ==3){
        NSString *string = @"卢启明，男，现任甘肃省人民医院副院长，教授，博士研究生导师，消化科主任医师，中国医师协会消化医师分会常委、中华医学会消化病分会委员、中华医学会甘肃省消化专业委员会主任委员、甘肃省领军人才第一层卢启明，男，现任甘肃省人民医院副院长，教授，博士研究生导师，消化科主任医师，中国医师协会消化医师分会常委、中华医学会消化病分会委员、中华医学会甘肃省消化专业委员会主任委员、甘肃省领军人才第一层";
          CGSize introSize = [FCCommonUtil sizeWithString:string font:[UIFont systemFontOfSize:14.0] ContentMaxSize:CGSizeMake(KmainScreenWidth-30, 2000)];
        if (_introRowisOpen) {
            CGFloat introRowHight = 0;
            if (124+introSize.height<172) {
                introRowHight = 172;
            }else{
                introRowHight = 124+introSize.height;
            }
            return introRowHight;
        }else{
          return 172;
        }
    }else if (indexPath.row ==4){
        return 51;
    }else{
        return 66;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        DoctorHeadTableViewCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorHeadTableViewCell"];
        return headCell;
    }else if (indexPath.row ==1){
        DoctorMajorTableViewCell *majorCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorMajorTableViewCell"];
        majorCell.openButton.selected = _majorRowisOpen;
        return majorCell;

    }else if (indexPath.row ==2){
        DoctorFucTableViewCell *functionCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorFucTableViewCell"];
        return functionCell;
    }else if (indexPath.row ==3){
        DoctorIntroTableViewCell *introCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorIntroTableViewCell"];
        introCell.openButton.selected = _introRowisOpen;
        return introCell;
    }else if (indexPath.row ==4){
        DoctorSectionTableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorSectionTableViewCell"];
        return sectionCell;
    }else{
        DoctorStarTableViewCell *starCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorStarTableViewCell"];
        return starCell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==1) {
        _majorRowisOpen = !_majorRowisOpen;
        [self.mainTableView reloadData];

    }else if (indexPath.row ==3){
        _introRowisOpen = !_introRowisOpen;
        [self.mainTableView reloadData];
    } else if (indexPath.row == 4){
        PatientsEvaluationViewController *patientsEvaluation = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"PatientsEvaluationViewController"];
        [self.navigationController pushViewController:patientsEvaluation animated:YES];
    }
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
