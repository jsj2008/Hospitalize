//
//  HomeViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeItmeTableViewCell.h"
#import "HomeBannerTableViewCell.h"
#import "HomeHospitalizeTableViewCell.h"
#import "OrderViewController.h"
#import "KNBannerView.h"
#import "FCMacros.h"
#import "DepartmentsListViewController.h"
#import "SearchViewController.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate, KNBannerViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
// 设置 网络 轮播图
@property (strong, nonatomic) KNBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *qrcodeScanningButton;
@property (weak, nonatomic) IBOutlet UIButton *positioningButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;


@property (weak, nonatomic) IBOutlet UIView *barTitleView;
@property (weak, nonatomic) IBOutlet UITextField *barSearchTextField;
@property (weak, nonatomic) IBOutlet UIButton *barQrcodeScanningButton;
@property (weak, nonatomic) IBOutlet UIButton *barPositioningButton;
@property (weak, nonatomic) IBOutlet UIButton *barSearchButton;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.alpha = 0;
    self.barTitleView.alpha = 0;
    [self scrollViewDidScroll:self.mainTableView];
    self.tabBarController.tabBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.alpha = 1;
    self.barTitleView.alpha = 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title =@"";
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
    // 搜索框左的提示图标
    UIImageView *leftView = [[UIImageView alloc]init];
    leftView.image = [UIImage imageNamed:@"home_icon_search"];
    leftView.size = CGSizeMake(leftView.image.size.width + 10, leftView.image.size.height);
    leftView.contentMode = UIViewContentModeCenter;
    self.searchTextField.leftView = leftView;
    self.searchTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *barLeftView = [[UIImageView alloc]init];
    barLeftView.image = [UIImage imageNamed:@"home_icon_search"];
    barLeftView.size = CGSizeMake(barLeftView.image.size.width + 10, barLeftView.image.size.height);
    barLeftView.contentMode = UIViewContentModeCenter;
    self.barSearchTextField.leftView = barLeftView;
    self.barSearchTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.searchButton addTarget:self action:@selector(goSearchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.barSearchButton addTarget:self action:@selector(goSearchAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.navigationController.navigationBar.alpha = 0;
    self.barTitleView.alpha = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//搜索事件
-(void)goSearchAction:(id)sender{
    SearchViewController *search = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:search animated:YES];
}
//二维码扫描事件
-(void)qrcodeScanningAction:(id)sender{
    
}
//预约挂号事件
- (void)makeAnAppointmentAction:(id)sender {
    OrderViewController *order = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"OrderViewController"];
    [self.navigationController pushViewController:order animated:YES];
}
//在线咨询事件
- (void)onlineConsultingAction:(id)sender {
    
}
//互联网诊室事件
- (void)internetOfficeAction:(id)sender {
    
}
//我的收藏事件
- (void)myCollectionAction:(id)sender {
    DepartmentsListViewController *departmentsListViewController = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"DepartmentsListViewController"];
    [self.navigationController pushViewController:departmentsListViewController animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return KmainScreenHeight * 175 / 667;
    } else if (indexPath.row == 1){
        return 128;
    }
    return 80;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 18;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HomeBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeBannerTableViewCell" forIndexPath:indexPath];
        if ([[cell.bannerView subviews] count] == 0) {
            NSArray *imgArr = @[@"1.jpg", @"2.jpg"];
            // 设置 网络 轮播图
            KNBannerView *bannerView = [KNBannerView bannerViewWithLocationImagesArr:[imgArr mutableCopy] frame:CGRectMake(0, 0, KmainScreenWidth, KmainScreenHeight * 175 / 667)];
            bannerView.delegate = self;
            [cell.bannerView addSubview: bannerView];
        }
        return cell;
    } else if (indexPath.row == 1){
        HomeItmeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeItmeTableViewCell" forIndexPath:indexPath];
        [cell.makeAnAppointmentButton addTarget:self action:@selector(makeAnAppointmentAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.onlineConsultingButton addTarget:self action:@selector(onlineConsultingAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.internetOfficeButton addTarget:self action:@selector(internetOfficeAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.myCollectionButton addTarget:self action:@selector(myCollectionAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else {
        HomeHospitalizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeHospitalizeTableViewCell" forIndexPath:indexPath];
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float alpha = self.mainTableView.contentOffset.y/(KmainScreenHeight * 175 / 667 - 64);
    if (alpha > 1){
        alpha = 1;
    }
    self.barTitleView.alpha = alpha;
    self.barSearchTextField.alpha = alpha;
    self.barQrcodeScanningButton.alpha = alpha;
    self.barPositioningButton.alpha =alpha;
}


-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

/**
 banner点击事件
 */
- (void)bannerView:(KNBannerView *)bannerView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSInteger)index{
    
}


@end
