//
//  HospitalNoticeViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//  医院公告

#import "HospitalNoticeViewController.h"
#import "HospitalNoticeTimeTableViewCell.h"
#import "HospitalNoticeMessageTableViewCell.h"
#import "MJRefresh.h"
#import "NMRefreshGifHeader.h"
#import "UILogic.h"
#import "NMProgressViewController.h"

@interface HospitalNoticeViewController ()<UITableViewDelegate, UITableViewDataSource>{
    
    int _pageNo;
    CGFloat _totleNo;
}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic ,strong) NSMutableArray *dataSourceArr;


@end

@implementation HospitalNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"医院公告";
    _pageNo = 1;
    self.dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    // 添加下拉刷新
    NMRefreshGifHeader *header = [NMRefreshGifHeader headerWithRefreshingTarget:self
                                                               refreshingAction:@selector(getNewData)];
    
    header.lastUpdatedTimeLabel.hidden = YES;// 隐藏下拉刷新时间
    header.stateLabel.hidden = YES;// 隐藏下拉刷新状态
    self.mainTableView.mj_header = header;
    WS(self);
    self.mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        SS(self);
        [self getNextPageData];
    }];
    [self callGetHospAnnAPI:YES];

    
}

- (void)getNewData
{
    _totleNo = 0;
    _pageNo = 1;
    self.dataSourceArr = nil;
    [self callGetHospAnnAPI:NO];
}

- (void)getNextPageData
{
    if (_totleNo > 0) {
        if (_totleNo == self.dataSourceArr.count) {
            [self.mainTableView.mj_footer endRefreshing];
            [self.mainTableView.mj_footer setState:MJRefreshStateNoMoreData];
            self.mainTableView.tableFooterView = [[UIView alloc] init];
        }else{
            _pageNo ++;
            [self callGetHospAnnAPI:NO];
        }
    }else{
        [self.mainTableView.mj_footer setState:MJRefreshStateNoMoreData];
        self.mainTableView.tableFooterView = [[UIView alloc] init];
    }
}

#pragma mark - API

- (void)callGetHospAnnAPI:(BOOL)showProgress
{
    if (showProgress) {
        [NMProgressViewController progressViewWithBody:NSLocalizedString(@"LoadingPleaseWait", @"") type:1 hidesAfter:0 show:YES];
    }
    NXTFPage *page = [[NXTFPage alloc]init];
    page.pageNo = _pageNo;
    page.pageSize = 10;
    WS(self);
    [AMAAppointmentAPI getHospAnn:page hospId:self.hospitalId success:^(NXTFGetHospAnnResp *getHospAnnResp) {
        [NMProgressViewController dismissCurrentViewController];
        
        SS(self);
        [self.mainTableView.mj_footer endRefreshing];
        [self.mainTableView.mj_header endRefreshing];
        
        _totleNo = getHospAnnResp.page.total;
        if (self.dataSourceArr == nil) {
            self.dataSourceArr = [[NSMutableArray alloc]initWithCapacity:0];
        }
        if (getHospAnnResp.hospAnn.count > 0) {
            [self.dataSourceArr addObjectsFromArray:getHospAnnResp.hospAnn];
            [self.mainTableView reloadData];
        }
        if (self.dataSourceArr.count == 0) {
//            [self errorViewShow:NO errorButtonAction:nil errorButtonTitle:@"" errorImageName:@"" promptLabelText:@"暂无公告" errorBgColor:nil];
            self.mainTableView.mj_footer.hidden = YES;
        }else{
//            [self errorViewHidden];
            self.mainTableView.mj_footer.hidden = NO;
        }
    } failure:^(NSError *error) {
        
        SS(self);
        [NMProgressViewController dismissCurrentViewController];
        [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView.mj_footer endRefreshing];
        [[FCAlertLabel sharedAlertLabel] showAlertLabelWithAlertString:error.domain];
    }];
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        return 56;
    } else if (indexPath.row % 2 == 1){
        return 200;
    }
    return 0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        HospitalNoticeTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalNoticeTimeTableViewCell" forIndexPath:indexPath];
        cell.timeLabel.layer.masksToBounds = YES;
        return cell;
    } else if (indexPath.row % 2 == 1){
        HospitalNoticeMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalNoticeMessageTableViewCell" forIndexPath:indexPath];
        cell.hospitalNoticeMessageView.layer.masksToBounds = YES;
        
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

- (CGFloat)getCellHeighWith:(NXTFHospAnnDto *)annModel
{
    CGFloat cellHeigh;
    CGFloat titleHeigh = [[UILogic sharedInstance]getHeightByText:annModel.title width:ScreenWidth-50 fontSize:17.0 space:0];
    CGFloat contentHeigt = [[UILogic sharedInstance] getHeightByText:annModel.content width:ScreenWidth-50 fontSize:14.f space:0];
    cellHeigh = titleHeigh + contentHeigt + 114;
    return cellHeigh;
}

@end
