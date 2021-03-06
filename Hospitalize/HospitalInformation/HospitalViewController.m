//
//  HospitalViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//  医院详情

#import "HospitalViewController.h"
#import "HospitalFootCollectionReusableView.h"
#import "HospitalCollectionViewCell.h"
#import "HospitalHeadCollectionReusableView.h"
#import "HospitalEvaluateViewController.h"
#import "NMProgressViewController.h"
#import <NioxCore/NioxCore.h>

#import "ReportListViewController.h"
#import "DepartmentsListViewController.h"
#import "HospitalNoticeViewController.h"
#import "HospitalProfileViewController.h"
#import "FCAlertAction.h"


@interface HospitalViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;


@end

@implementation HospitalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.titleName;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shoucang"] style:UIBarButtonItemStylePlain target:self action:@selector(collectionAction:)];
    
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark – Delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KmainScreenWidth, 254);
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(KmainScreenWidth, 63);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        HospitalHeadCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HospitalHeadCollectionReusableView" forIndexPath:indexPath];
        [headerView.hospitaImageView setImage:[UIImage imageNamed:@"yiyuanmoren"]];
        [headerView.hospitalView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
        [headerView.telButton addTarget:self action:@selector(callHospitalAction:) forControlEvents:UIControlEventTouchUpInside];
        reusableview = headerView;
        return reusableview;
    } else if (kind == UICollectionElementKindSectionFooter){
        HospitalFootCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HospitalFootCollectionReusableView" forIndexPath:indexPath];
        [footerView.evaluationButton addTarget:self action:@selector(evaluationHospitalAction:) forControlEvents:UIControlEventTouchUpInside];
        reusableview = footerView;
        return reusableview;
    }
    return nil;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width/3, 95);
}

- (UIEdgeInsets) collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HospitalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HospitalCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.promptInformation.hidden = YES;
    if (indexPath.item == 0) {
        cell.name.text = @"预约挂号";
        [cell.imageView setImage:[UIImage imageNamed:@"yuyueguahao"]];
    } else if (indexPath.item == 1){
        cell.name.text = @"处方缴费";
        [cell.imageView setImage:[UIImage imageNamed:@"chufanjiaofei"]];
    } else if (indexPath.item == 2){
        cell.name.text = @"取报告";
        [cell.imageView setImage:[UIImage imageNamed:@"qubaogao"]];
    } else if (indexPath.item == 3){
        cell.name.text = @"住院缴费";
        [cell.imageView setImage:[UIImage imageNamed:@"zhuyuanjiaofei"]];
    } else if (indexPath.item == 4){
        cell.name.text = @"医院简介";
        [cell.imageView setImage:[UIImage imageNamed:@"yiyuanjianjie"]];
    } else if (indexPath.item == 5){
        cell.name.text = @"医院公告";
        [cell.imageView setImage:[UIImage imageNamed:@"yiyuangonggao"]];
    } else if (indexPath.item == 6){
        cell.name.text = @"就诊卡充值";
        [cell.imageView setImage:[UIImage imageNamed:@"jiuzhenkachongzhi"]];
    } else if (indexPath.item == 7){
        cell.name.text = @"排队等候";
        cell.promptInformation.hidden = NO;
        [cell.imageView setImage:[UIImage imageNamed:@"paiduidenghou"]];
    } else if (indexPath.item == 8){
        cell.name.text = @"体检";
        cell.promptInformation.hidden = NO;
        [cell.imageView setImage:[UIImage imageNamed:@"tijian"]];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (indexPath.item == 0) {//预约挂号
        DepartmentsListViewController *departmentsListViewController = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"DepartmentsListViewController"];
        [self.navigationController pushViewController:departmentsListViewController animated:YES];
    } else if (indexPath.item == 1){//处方缴费
        
    } else if (indexPath.item == 2){//取报告
        ReportListViewController *reportList = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"ReportListViewController"];
        [self.navigationController pushViewController:reportList animated:YES];
    } else if (indexPath.item == 3){//住院缴费
        
    } else if (indexPath.item == 4){//医院简介
        HospitalProfileViewController *hospitalProfile = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalProfileViewController"];
        [self.navigationController pushViewController:hospitalProfile animated:YES];
    } else if (indexPath.item == 5){//医院公告
        HospitalNoticeViewController *hospitalNotice = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalNoticeViewController"];
        [self.navigationController pushViewController:hospitalNotice animated:YES];
    } else if (indexPath.item == 6){//就诊卡充值
        
    } else if (indexPath.item == 7){//排队等候
        
    } else if (indexPath.item == 8){//体检
        
    }
}

//医院评价
-(void)evaluationHospitalAction:(id)sender{
    HospitalEvaluateViewController *hospitalEvaluate = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalEvaluateViewController"];
    [self.navigationController pushViewController:hospitalEvaluate animated:YES];
}

//收藏事件
-(void)collectionAction:(id)sender{
    
}
//打电话事件
-(void)callHospitalAction:(id)sender{
    NSArray *array = @[@"012-12345678"];
    [FCAlertAction showActionSheetWithTitle:nil message:@"拨打医院电话"  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:array chooseBlock:^(NSInteger buttonIdx) {
        if (buttonIdx > 0) {
            NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",array[buttonIdx - 1]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    }];
}


@end
