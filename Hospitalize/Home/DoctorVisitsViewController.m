//
//  DoctorVisitsViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "DoctorVisitsViewController.h"
#import "VisitsTitleView.h"
#import "VisitsScheduleView.h"
#import "VisitsStopScheduleView.h"

CGFloat const VisitsLeftAndRightMargin = 15.0f;
CGFloat const VisiteStopScheduleSpace = 10.0f;
CGFloat const VisiteBottomSpace = 20.0f;
NSInteger const VisiteShowDayNumber = 7;

@interface DoctorVisitsViewController ()


@property (nonatomic, strong) IBOutlet UILabel *myMonthLabel;
@property (nonatomic, strong) IBOutlet UIScrollView *myBackgroundView;
@property (nonatomic, strong) NSMutableArray *daysArray;
@property (nonatomic, strong) NSMutableArray *schedulesArray;
@property (nonatomic, strong) NSMutableArray *stopSchedulesArray;
@property (nonatomic, strong) IBOutlet VisitsTitleView *visitsTitleView;
@property (nonatomic, strong) VisitsScheduleView *visitsScheduleView;
@property (nonatomic, strong) VisitsStopScheduleView *visitsStopScheduleView;

@end

@implementation DoctorVisitsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"出诊表";
    
    [self mainLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter and Setter

- (NSMutableArray *)daysArray
{
    if (!_daysArray) {
        _daysArray = [NSMutableArray array];
    }
    return _daysArray;
}

- (NSMutableArray *)schedulesArray
{
    if (!_schedulesArray) {
        _schedulesArray = [NSMutableArray array];
    }
    return _schedulesArray;
}

- (NSMutableArray *)stopSchedulesArray
{
    if (!_stopSchedulesArray) {
        _stopSchedulesArray = [NSMutableArray array];
    }
    return _stopSchedulesArray;
}

- (VisitsScheduleView *)visitsScheduleView
{
    if (!_visitsScheduleView) {
        _visitsScheduleView = [[VisitsScheduleView alloc] initWithWidth:CGRectGetWidth(self.view.frame) - VisitsLeftAndRightMargin * 2
                                                                 Schedule:self.schedulesArray date:self.daysArray];
    }
    return _visitsScheduleView;
}

- (VisitsStopScheduleView *)visitsStopScheduleView
{
    if (!_visitsStopScheduleView) {
        _visitsStopScheduleView = [[VisitsStopScheduleView alloc] initWithWidth:CGRectGetWidth(self.view.frame) - VisitsLeftAndRightMargin * 2
                                                                    stopSchedules:self.stopSchedulesArray];
    }
    return _visitsStopScheduleView;
}

#pragma mark - UI

- (void)mainLayout {
    
    self.myMonthLabel.text = [self getYearAndMonthWith:[NSDate date]];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.visitsTitleView setVisitsTitleViewLayout:CGRectGetWidth(self.view.frame) - VisitsLeftAndRightMargin * 2
                                              date:[self getDateArr]];
}

- (void)schedulesLayout
{
    [self.myBackgroundView addSubview:self.visitsScheduleView];
    CGRect frame = self.visitsScheduleView.frame;
    frame.origin.y = 2;
    self.visitsScheduleView.frame = frame;
}

- (void)stopSchedulesLayout
{
    [self.myBackgroundView addSubview:self.visitsStopScheduleView];
    CGRect frame = self.visitsStopScheduleView.frame;
    frame.origin.y = CGRectGetMaxY(self.visitsScheduleView.frame) + VisiteStopScheduleSpace;
    self.visitsStopScheduleView.frame = frame;
}

- (void)myBackgroundViewLayout
{
    CGSize contentSize = self.myBackgroundView.contentSize;
    contentSize.height = CGRectGetMaxY(self.visitsStopScheduleView.frame) + VisiteBottomSpace;
    self.myBackgroundView.contentSize = contentSize;
}

#pragma mark - Private

- (NSMutableArray *)getDateArr
{
    NSMutableArray *dateArr = [[NSMutableArray alloc]initWithCapacity:0];
    NSInteger days = 0;
    for (int i = 0; i < VisiteShowDayNumber; i ++) {
        NSDateComponents *weeks = [[NSDateComponents alloc] init];
        weeks.day = days;
        NSDate *endDate = [[NSCalendar currentCalendar] dateByAddingComponents:weeks toDate:[self zeroOfDate] options:0];
        if (endDate != nil) {
            [dateArr addObject:endDate];
        }
        if (days == 35) {
            break;
        }
        days = days + 1;
    }
    return dateArr;
}

- (NSDate *)zeroOfDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:[NSDate date]];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    
    // components.nanosecond = 0 not available in iOS
    NSTimeInterval ts = (double)(int)[[calendar dateFromComponents:components] timeIntervalSince1970];
    return [NSDate dateWithTimeIntervalSince1970:ts];
}

- (NSString *)getDateWith:(NSDate *)date
{
    NSString *dateStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

- (NSString *)getYearAndMonthWith:(NSDate *)date
{
    NSString *dateStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy年MM月"];
    dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

- (NSMutableArray *)dateString:(NSArray *)array
{
    NSMutableArray *dateArr = [NSMutableArray array];
    for (NSDate *date in array) {
        [dateArr addObject:[self getDateWith:date]];
    }
    return dateArr;
}


@end

