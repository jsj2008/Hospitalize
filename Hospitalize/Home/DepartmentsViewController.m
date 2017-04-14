//
//  DepartmentsViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "DepartmentsViewController.h"
#import "DepartmentsTableViewCell.h"
#import "FCMacros.h"
#import "DoctorTimePointViewController.h"
#import "DoctorVisitsViewController.h"

#import "FCCalender.h"
#import "DateLogic.h"

@interface DepartmentsViewController ()<UITableViewDataSource, UITableViewDelegate,FCCalenderDelegate>{
    FCCalender *_calendar;
}

@property (nonatomic, strong)  NSDate *selectDate;  //日历选择的日期
@property (strong, nonatomic) NSMutableArray *dateArr;//将_dateStrKeyArr中的NSString转换为NSDate
@property (copy, nonatomic) NSString *selectDateStr;
@property (strong, nonatomic) NSArray *dateStrKeyArr;//所有可挂号日期



@property(nonatomic, strong)NSMutableArray *doctorArray;
@property (weak, nonatomic) IBOutlet UIView *calendarView;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation DepartmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.title;
    
    self.doctorArray = [NSMutableArray array];
    self.doctorArray = [@[@"1",@"1",@"1",@"1",@"1",@"1",@"1"] mutableCopy];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_itme_rili"] style:UIBarButtonItemStylePlain target:self action:@selector(goNextAction:)];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
    
    [self createCalendar];
}

- (void)createCalendar {
    [_calendar removeFromSuperview];//移除之前创建的
    _calendar = [[FCCalender alloc]initWithFrame:CGRectMake(0, 0, KmainScreenWidth, 76) dataArr:_dateArr];
    
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
    [self.calendarView addSubview:_calendar];
}

#pragma mark - Protocol Delegate

/** NXCalenderDelegate */
- (void)selectWithDate:(NSDate *)date {
    //    NSLog(@"date=%@",date);
    self.selectDate = date;
    if (date) {
        _selectDateStr = [DateLogic getStringWithDate:date];
//        [self callRegPointsApi];
    } else {
        //返回日期空，不操作
    }
}

-(void)goNextAction:(id)sender{
    DoctorVisitsViewController *doctorVisitsViewController = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"DoctorVisitsViewController"];
    [self.navigationController pushViewController:doctorVisitsViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.doctorArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DepartmentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DepartmentsTableViewCell" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DoctorTimePointViewController *doctorTimePointViewController = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"DoctorTimePointViewController"];
    [self.navigationController pushViewController:doctorTimePointViewController animated:YES];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}


@end
