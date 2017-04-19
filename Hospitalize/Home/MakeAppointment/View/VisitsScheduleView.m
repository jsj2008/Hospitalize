//
//  VisitsScheduleView.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "VisitsScheduleView.h"

#define VisitsScheduleSelectedBackgroundColor [UIColor colorWithRed:0xf0/255.0f green:0xf0/255.0f blue:0xf0/255.0f alpha:1.0f]
#define VisitsScheduleSummaryColor [UIColor colorWithRed:0x66/255.0f green:0x66/255.0f blue:0x66/255.0f alpha:1.0f]
#define VisitsScheduleLineColor [UIColor colorWithRed:0x99/255.0f green:0x99/255.0f blue:0x99/255.0f alpha:1.0f]


CGFloat const VisitsScheduleItemHeight = 37.0f;
CGFloat const VisitsScheduleNameFontSize = 13.0f;
CGFloat const VisitsScheduleSummaryFontSize = 13.0f;


@interface NXVisitsScheduleItemView ()
{
    CGFloat _width;
}

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) NSMutableArray *daysArray;
@property (nonatomic, strong) NSArray *dateArray;

- (id)initWithWidth:(CGFloat)width date:(NSArray *)dates;

@end

@implementation NXVisitsScheduleItemView

- (id)initWithWidth:(CGFloat)width date:(NSArray *)dates
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _width = width;
        self.dateArray = dates;
        [self addSubview:self.nameLabel];
        [self itemLayout];
    }
    return self;
}

#pragma mark - Getter and Setter

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        CGFloat itemWidth = _width / 8.5f;
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -1, itemWidth * 1.5f, VisitsScheduleItemHeight+1)];
        _nameLabel.font = [UIFont systemFontOfSize:VisitsScheduleNameFontSize];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.layer.borderColor = VisitsScheduleLineColor.CGColor;
        _nameLabel.layer.borderWidth = 1;
        _nameLabel.textColor = VisitsScheduleSummaryColor;
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

- (NSArray *)dateArray
{
    if (!_dateArray) {
        _dateArray = [NSArray array];
    }
    return _dateArray;
}

#pragma mark - Private

- (void)itemLayout
{
    [self.daysArray removeAllObjects];
    CGFloat itemWidth = _width / 8.5f;
    for (int i = 0; i < self.dateArray.count; i++) {
        UILabel *dayLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + itemWidth * i-1, -1, itemWidth+1, VisitsScheduleItemHeight + 1)];
        dayLbl.numberOfLines = 0;
        dayLbl.textAlignment = NSTextAlignmentCenter;
        dayLbl.layer.borderColor = VisitsScheduleLineColor.CGColor;
        dayLbl.layer.borderWidth = 1;
        dayLbl.textColor = VisitsScheduleSummaryColor;
        dayLbl.font = [UIFont systemFontOfSize:VisitsScheduleSummaryFontSize];
        dayLbl.adjustsFontSizeToFitWidth = YES;
        [self.daysArray addObject:dayLbl];
        [self addSubview:dayLbl];
    }
}

- (void)setVisitsScheduleComment:(NSArray *)detail
{
    for (int i = 0; i < detail.count; i++) {
//        NXTFScheduleDetailDto *detailDto = detail[i];
        NSInteger index = [self.dateArray indexOfObject:@"暂时替代"];
        if (index < self.dateArray.count) {
            UILabel *dayLbl = self.daysArray[index];
            if (@"暂时替代".length > 0) {
                dayLbl.backgroundColor = VisitsScheduleSelectedBackgroundColor;
                dayLbl.text = [@"暂时替代" stringByReplacingOccurrencesOfString:@"&" withString:@"\n"];
            }
        }
    }
}


@end


@interface VisitsScheduleView ()
{
    CGFloat _width;
}

@end

@implementation VisitsScheduleView

- (id)initWithWidth:(CGFloat)width Schedule:(NSArray *)schedule date:(NSArray *)dates
{
    _width = width;
    self = [super initWithFrame:CGRectMake(0, 0, _width, VisitsScheduleItemHeight * schedule.count)];
    if (self) {
        [self scheduleItemLayout:schedule date:dates];
    }
    return self;
}

#pragma mark - Getter and Setter

- (void)scheduleItemLayout:(NSArray *)schedules date:(NSArray *)dates
{
    for (int i = 0; i < schedules.count; i++) {
//        NXTFScheduleDto *scheduleDto = schedules[i];
        NXVisitsScheduleItemView *item = [[NXVisitsScheduleItemView alloc] initWithWidth:_width date:dates];
        item.frame = CGRectMake(0, VisitsScheduleItemHeight * i, _width, VisitsScheduleItemHeight);
        item.nameLabel.text = @"暂时替代";
        [item setVisitsScheduleComment:@[@"暂时替代"]];
        [self addSubview:item];
    }
}

@end

