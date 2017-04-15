//
//  OrderViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewCell.h"
#import "OrderRankView.h"
#import "OrderScreenView.h"
#import "ViewControllerUtil.h"
#import "PayTableViewController.h"
#import "DepartmentsListViewController.h"
#import "OrderMessageViewController.h"
#import "MPLocationManager.h"
#import "SearchViewController.h"


@interface OrderViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) OrderRankView  *orderRankView;//排序视图
@property (strong, nonatomic) OrderScreenView *orderScreenView;//筛选视图
@property (weak, nonatomic) IBOutlet UIButton *rankButton;//排序按钮
@property (weak, nonatomic) IBOutlet UIButton *screenButton;//筛选按钮

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationController.navigationBar.hidden = YES;

    
    [self loadcationAction];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"order_right_search"] style:UIBarButtonItemStylePlain target:self action:@selector(sreachAction)];
    
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    // 排序
    self.orderRankView = [[OrderRankView alloc] initWithStartY:42];
    [self.view addSubview:self.orderRankView];
    //筛选
    self.orderScreenView = [[OrderScreenView alloc] initWithStartY:42];
    [self.view addSubview:self.orderScreenView];
    
    [self.rankButton setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
    [self.rankButton setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateSelected];
    self.rankButton.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,-80);
    self.rankButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    [self.screenButton setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
    [self.screenButton setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateSelected];
    self.screenButton.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,-80);
    self.screenButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
}
//定位
-(void)loadcationAction{
    MPLocationManager *mp = [MPLocationManager shareInstance];
    [mp startSystemLocationWithRes:^(CLLocation *loction, NSError *error) {
        if (error) {
            NSLog(@"定位失败：%@",error);
        }
        CLGeocoder *geocoder=[[CLGeocoder alloc]init];
        [geocoder reverseGeocodeLocation:loction completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            //处理手机语言 获得城市的名称（中文）
            NSMutableArray *userDefaultLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
            NSString *currentLanguage = [userDefaultLanguages objectAtIndex:0];
            //如果不是中文 则强制先转成中文 获得后再转成默认语言
            if (![currentLanguage isEqualToString:@"zh-Hans"]&&![currentLanguage isEqualToString:@"zh-Hans-CN"]) {
                //IOS9前后区分
                if (isIOS9) {
                    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-Hans", nil] forKey:@"AppleLanguages"];
                }
                else
                {
                    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-Hans", nil] forKey:@"AppleLanguages"];
                }
            }
            
            //转换地理信息
            if (placemarks.count>0) {
                CLPlacemark *placemark=[placemarks objectAtIndex:0];
                //获取城市
                NSString *city = placemark.locality;
                if (!city) {
                    //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                    city = placemark.administrativeArea;
                }
                
                NSLog(@"当前城市：[%@]",city);
                
                // 城市名传出去后,立即 Device 语言 还原为默认的语言
                [[NSUserDefaults standardUserDefaults] setObject:userDefaultLanguages forKey:@"AppleLanguages"];
            }
        }];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderTableViewCell" forIndexPath:indexPath];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DepartmentsListViewController *departmentsListViewController = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"DepartmentsListViewController"];
    [self.navigationController pushViewController:departmentsListViewController animated:YES];

}
//排序
- (IBAction)paixuAction:(id)sender {
    UIButton *button = sender;
    button.selected  = !button.selected;
    if (self.screenButton.selected) {
        self.screenButton.selected = !self.screenButton.selected;
    }
    if (self.orderScreenView.show) {
       [self.orderScreenView orderScreen];
    }
    [self.orderRankView orderRank];
}
//筛选
- (IBAction)saixuanAction:(id)sender {
    UIButton *button = sender;
    button.selected  = !button.selected;
    if (self.rankButton.selected) {
        self.rankButton.selected = !self.rankButton.selected;
    }
    if (self.orderRankView.show) {
        [self.orderRankView orderRank];
    }
    [self.orderScreenView orderScreen];
}

-(void)sreachAction{
    SearchViewController *search = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:search animated:YES];
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
