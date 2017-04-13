//
//  VisitsTitleView.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "VisitsTitleView.h"


CGFloat const VisitsTitleDayHeight = 24.0f;
CGFloat const VisitsTitleWeekHeight = 15.0f;
CGFloat const VisitsTitleDayFontSize = 20.0f;
CGFloat const VisitsTitleWeekFontSize = 12.0f;
CGFloat const VisitsTitleDayWeekSpace = 14.0f;


#define VisitsTitleColor [UIColor colorWithRed:0x99/255.0f green:0x99/255.0f blue:0x99/255.0f alpha:1.0f]
#define VisitsDayColor [UIColor colorWithRed:0x66/255.0f green:0x66/255.0f blue:0x66/255.0f alpha:1.0f]

@interface VisitsDayView ()

@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UIView *line;

@end

@implementation VisitsDayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.dayLabel];
        [self addSubview:self.weekLabel];
        [self addSubview:self.line];
    }
    return self;
}

#pragma mark - Getter and Setter

- (UILabel *)dayLabel
{
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), VisitsTitleDayHeight)];
        _dayLabel.font = [UIFont systemFontOfSize:VisitsTitleDayFontSize];
        _dayLabel.textColor = VisitsDayColor;
        _dayLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dayLabel;
}

- (UILabel *)weekLabel
{
    if (!_weekLabel) {
        _weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                               CGRectGetMaxY(self.dayLabel.frame) + VisitsTitleDayWeekSpace,
                                                               CGRectGetWidth(self.frame), VisitsTitleWeekHeight)];
        _weekLabel.font = [UIFont systemFontOfSize:VisitsTitleWeekFontSize];
        _weekLabel.textColor = VisitsTitleColor;
        _weekLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _weekLabel;
}

- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dayLabel.frame),
                                                         2, 1, VisitsTitleDayHeight - 4)];
        _line.backgroundColor = VisitsTitleColor;
    }
    return _line;
}

#pragma mark - Private

- (void)hiddenLine:(BOOL)hidden
{
    self.line.hidden = hidden;
}

@end


@interface VisitsTitleView () {
    CGFloat _oneDayWidth;
}

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) NSMutableArray *daysArray;
@property (nonatomic, strong) NSArray *daysNumberArray;

@end

@implementation VisitsTitleView

#pragma mark - Public

- (void)setVisitsTitleViewLayout:(CGFloat)width date:(NSArray *)dateArray
{
    _oneDayWidth = width / 8.5f;
    [self addSubview:self.nameLabel];
    self.daysNumberArray = dateArray;
    [self daysLayout:dateArray.count];
}

#pragma mark - Getter and Setter

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, VisitsTitleDayHeight+VisitsTitleDayWeekSpace , _oneDayWidth * 1.5f, VisitsTitleWeekHeight)];
        _nameLabel.text = NSLocalizedString(@"VisitsName", nil);
        _nameLabel.font = [UIFont systemFontOfSize:VisitsTitleWeekFontSize];
        _nameLabel.textColor = VisitsTitleColor;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (NSMutableArray *)daysArray
{
    if (!_daysArray) {
        _daysArray = [NSMutableArray array];
    }
    return _daysArray;
}

- (NSArray *)daysNumberArray
{
    if (!_daysNumberArray) {
        _daysNumberArray = [NSArray array];
    }
    return _daysNumberArray;
}

#pragma mark - Private

- (void)daysLayout:(NSInteger)days
{
    [self.daysArray removeAllObjects];
    for (int i = 0; i < days; i++) {
        VisitsDayView *day = [[VisitsDayView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + _oneDayWidth *i,
                                0,
                                _oneDayWidth,
                                CGRectGetHeight(self.frame))];
        day.dayLabel.text = [self getdayWith:self.daysNumberArray[i]];
        day.weekLabel.text = [self getweekWith:self.daysNumberArray[i]];
        if (i == days - 1) {
            [day hiddenLine:YES];
        }
        [self.daysArray addObject:day];
        [self addSubview:day];
    }
}

- (NSString *)getdayWith:(NSDate *)date
{
    NSString *dateStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd"];
    dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

- (NSString *)getweekWith:(NSDate *)date
{
    NSArray *weeks = [NSArray arrayWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit |NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    
    return [NSString stringWithFormat:NSLocalizedString(@"VisitsWeek", nil),weeks[[comps weekday] - 1]];
}

@end
