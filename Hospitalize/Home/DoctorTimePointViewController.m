//
//  DoctorTimePointViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "DoctorTimePointViewController.h"
#import "FCCalender.h"
#import "FCMacros.h"
#import "DateLogic.h"
#import "DoctorTimePointCell.h"


@interface DoctorTimePointViewController ()<UITableViewDelegate, UITableViewDataSource, FCCalenderDelegate>{
    
    FCCalender *_calendar;

}

@property (copy, nonatomic) NSString *selectDateStr;
@property (strong, nonatomic) NSArray *dateStrKeyArr;//所有可挂号日期
@property (strong, nonatomic) NSMutableArray *dateArr;//将_dateStrKeyArr中的NSString转换为NSDate
@property (assign, nonatomic) BOOL isOnlyCheckCanBooking;//是否仅查看可预约号源


@property (weak, nonatomic) IBOutlet UIView *calendarView;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong)NSMutableArray *timePointArray;

@end

@implementation DoctorTimePointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timePointArray = [NSMutableArray array];
    self.timePointArray = [@[@"1",@"1",@"1",@"1",@"1",@"1",@"1"] mutableCopy];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_itme_rili"] style:UIBarButtonItemStylePlain target:self action:@selector(goNextPersonAction:)];

    
    
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
    [self createCalendar];
}


- (void)createCalendar {
    [_calendar removeFromSuperview];//移除之前创建的
    _calendar = [[FCCalender alloc]initWithFrame:CGRectMake(0, 64, KmainScreenWidth, 70) dataArr:_dateArr];
    
    if (self.selectDate) {
        _selectDateStr = [DateLogic getStringWithDate:self.selectDate];
        for (NSString *dateStr in _dateStrKeyArr) {
            //            NSLog(@"日期比对:dateStr=%@,_selectDateStr=%@。",dateStr,_selectDateStr);
            if ([dateStr isEqualToString:_selectDateStr]) {
                _calendar.selectDate = self.selectDate;
                break;
            } else {
                _calendar.selectDate = _dateArr.firstObject;
            }
        }
    } else {
        _calendar.selectDate = _dateArr.firstObject;//这时候默认选中该医生有号点的第一天
        _selectDateStr = _dateStrKeyArr.firstObject;
    }
    _calendar.delegate = self;
    [self.view addSubview:_calendar];
}

#pragma mark - Protocol Delegate

/** NXCalenderDelegate */
- (void)selectWithDate:(NSDate *)date {
    //    NSLog(@"date=%@",date);
    self.selectDate = date;
    if (date) {
        _selectDateStr = [DateLogic getStringWithDate:date];
    } else {
        //返回日期空，不操作
    }
}

-(void)goNextPersonAction:(id)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.timePointArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctorTimePointCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DoctorTimePointCell" forIndexPath:indexPath];
    //箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //无箭头
//    cell.accessoryType = UITableViewCellAccessoryNone;

    
    cell.timeLabel.text = @"cccc";
    cell.detailLabel.text = [NSString stringWithFormat:@"%@\n￥%@",@"dddddd",@"fffff"];
    return cell;
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