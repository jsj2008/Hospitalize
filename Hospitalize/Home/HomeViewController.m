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
#import "SearchViewController.h"
#import "CityListViewController.h"

#import "LoginViewController.h"
#import "HospitalNoticeViewController.h"
#import "HospitalEvaluateViewController.h"
#import "NXCustomLeftBarButtonItem.h"
#import "UILogic.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate, KNBannerViewDelegate, UITextFieldDelegate,CityListViewDelegate>{
    UIView *titleView;    //导航栏背景view
    NSMutableArray * actDoArray;    //  直播信息数组
    NSString * selectCityName;      //选择的城市名字
    CGFloat titleViewAlpha;     // 导航栏背景的alpha

}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
// 设置 网络 轮播图
@property (strong, nonatomic) KNBannerView *bannerView;
@property (strong, nonatomic) NXCustomLeftBarButtonItem *leftBarButtonItem;
@property (strong, nonatomic) UIButton *rightButtonItem;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[COLOR4B89DC colorWithAlphaComponent:titleViewAlpha]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    titleView.backgroundColor = [UIColor whiteColor] ;
    self.navigationController.navigationBar.translucent = YES;
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[COLOR4B89DC colorWithAlphaComponent:1]] forBarMetrics:UIBarMetricsDefault];
    //导航栏下面黑线
    self.navigationController.navigationBar.shadowImage = nil;
}


#pragma mark - Refresh
- (void)initData {
    //    初始化数据
    titleViewAlpha=0;
    
    //配置界面属性
    self.leftBarButtonItem = [[NXCustomLeftBarButtonItem alloc]initWithTitle:NSLocalizedString(@"ChooseRegion", @"")];
    [self.leftBarButtonItem.clickButton addTarget:self action:@selector(leftBarButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *locationBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftBarButtonItem];
    
    // 左侧选地区的按钮调整位置
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, locationBarButtonItem];
    
    [self initLeftBarButtonItem];
    self.navigationItem.titleView = [self titleView];
    
    //    导航栏背景设置
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[COLOR4B89DC colorWithAlphaComponent:titleViewAlpha]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    //设置扫一扫按钮
    [self initRightButtonItem];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButtonItem];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
}

- (void)initLeftBarButtonItem {
    self.leftBarButtonItem.title = @"杭州";
}

- (void)initRightButtonItem {
    CGRect rightItemRect = CGRectMake(0, 0, 22, 22);
    self.rightButtonItem = [[UIButton alloc]initWithFrame:rightItemRect];
    [self.rightButtonItem setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
    [self.rightButtonItem setImage:[UIImage imageNamed:@"home_itme_qrcodeScanning"] forState:UIControlStateNormal];
    [self.rightButtonItem addTarget:self action:@selector(scanButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (UIView *)titleView {
    CGFloat leftBarWidth = self.leftBarButtonItem.bounds.size.width;
    CGFloat rightBarWidth = self.rightButtonItem.bounds.size.width;
    CGFloat titleHeight = 30;
    CGRect titleRect = CGRectMake(0, 0, ScreenWidth- leftBarWidth - rightBarWidth - 20, titleHeight);
    titleView = [[UIView alloc] initWithFrame:titleRect];
    titleView.backgroundColor = [UIColor whiteColor];
    titleView.layer.cornerRadius = titleHeight/2;
    titleView.layer.borderWidth = 0.5;
    titleView.layer.borderColor = [UIColor clearColor].CGColor;
    UIFont *textFont = [UIFont systemFontOfSize:14];
    NSString *searchText = @"搜索医院";
    CGFloat titleWidth = [[UILogic sharedInstance] getWidthByText:searchText font:textFont height:titleHeight];
    
    UILabel *searchTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, titleWidth, titleHeight)];
    searchTextLabel.text = searchText;
    searchTextLabel.font = textFont;
    searchTextLabel.textColor = COLOR666666;
    [titleView addSubview:searchTextLabel];
    
    UIImage *image = [UIImage imageNamed:@"home_icon_search"];
    UIImageView *searchImageView = [[UIImageView alloc] initWithImage:image];
    searchImageView.frame = CGRectMake(searchTextLabel.frame.origin.x - image.size.width - 10, (titleHeight - image.size.height)/2, image.size.width, image.size.height);
    [titleView addSubview:searchImageView];
    
    UIButton *searchButton = [[UIButton alloc] initWithFrame:titleRect];
    searchButton.backgroundColor = [UIColor clearColor];
    [searchButton addTarget:self action:@selector(goSearchAction:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:searchButton];
    
    return titleView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title =@"";
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    self.mainTableView.bounces = NO;
    
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickedWithCityName:(NSString*)cityName{
    
}


//定位事件
-(void)leftBarButtonItemClick:(id)sender{
    CityListViewController *cityListView = [[CityListViewController alloc]init];
    cityListView.delegate = self;
    //热门城市列表
    cityListView.arrayHotCity = [NSMutableArray arrayWithObjects:@"广州",@"北京",@"天津",@"厦门",@"重庆",@"福州",@"泉州",@"济南",@"深圳",@"长沙",@"无锡", nil];
    //历史选择城市列表
    cityListView.arrayHistoricalCity = [NSMutableArray arrayWithObjects:@"福州",@"厦门",@"泉州", nil];
    //定位城市列表
    cityListView.arrayLocatingCity   = [NSMutableArray arrayWithObjects:@"福州", nil];
    
    [self.navigationController pushViewController:cityListView animated:YES];
}

//搜索事件
-(void)goSearchAction:(id)sender{
    SearchViewController *search = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:search animated:YES];
}
//二维码扫描事件
-(void)scanButtonAction:(id)sender{
    
}
//预约挂号事件
- (void)makeAnAppointmentAction:(id)sender {
    OrderViewController *order = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"OrderViewController"];
    [self.navigationController pushViewController:order animated:YES];
}
//在线咨询事件
- (void)onlineConsultingAction:(id)sender {
    HospitalNoticeViewController *hospitalNotice = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalNoticeViewController"];
    [self.navigationController pushViewController:hospitalNotice animated:YES];
}
//互联网诊室事件
- (void)internetOfficeAction:(id)sender {
    HospitalEvaluateViewController *hospitalEvaluate = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalEvaluateViewController"];
    [self.navigationController pushViewController:hospitalEvaluate animated:YES];
}
//我的收藏事件
- (void)myCollectionAction:(id)sender {
    LoginViewController *login = [ViewControllerUtil getViewControllerFromLoginStoryboardWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:login animated:YES];
   
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

#pragma mark - ScrollViewDelegate
//根据滚动位置 重置导航栏 透明度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= 0) {
        self.navigationController.navigationBar.hidden=NO;
        CGFloat alpha = MIN(1, (offsetY)/99);
        titleViewAlpha = alpha;
        titleView.backgroundColor = [UIColor whiteColor];
        [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[COLOR4B89DC colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    } else {
        [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[[UIColor clearColor] colorWithAlphaComponent:0]] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.hidden=YES;
    }
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

-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
