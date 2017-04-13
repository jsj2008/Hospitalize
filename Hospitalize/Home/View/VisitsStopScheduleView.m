//
//  VisitsStopScheduleView.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "VisitsStopScheduleView.h"

#define VisitsStopScheduleSummaryBackgroundColor [UIColor colorWithRed:0xf5/255.0f green:0xf5/255.0f blue:0xf5/255.0f alpha:1.0f]
#define VisitsStopScheduleSummaryColor [UIColor colorWithRed:0x99/255.0f green:0x99/255.0f blue:0x99/255.0f alpha:1.0f]
#define VisitsStopScheduleExplainColor [UIColor colorWithRed:0x38/255.0f green:0x84/255.0f blue:0xd6/255.0f alpha:1.0f]

CGFloat const VisitsStopScheduleSummaryFontSize = 12.0f;
CGFloat const VisitsStopScheduleExplainFontSize = 10.0f;
CGFloat const VisitsStopScheduleCornerRadius = 8.0f;
CGFloat const VisitsStopScheduleSummaryHeight = 17.0f;
CGFloat const VisitsStopScheduleSummaryIconSize = 14.0f;
CGFloat const VisitsStopScheduleSummarySpace = 6.0f;
CGFloat const VisitsStopScheduleSpace = 11.0f;

@interface NXVisitsStopScheduleItemView ()

@property (nonatomic, strong) UILabel *summaryLabel;
@property (nonatomic, strong) UIImageView *summaryIcon;

@end

@implementation NXVisitsStopScheduleItemView

- (id)initWithStopScheduleSummary:(NSString *)summary
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.summaryLabel.text = [summary stringByReplacingOccurrencesOfString:@"&" withString:@"、"];
        [self.summaryLabel sizeToFit];
        [self resetLayoutWithWidth:CGRectGetWidth(self.summaryLabel.frame)];
        [self addSubview:self.summaryLabel];
        [self addSubview:self.summaryIcon];
        self.backgroundColor = VisitsStopScheduleSummaryBackgroundColor;
    }
    return self;
}

#pragma mark - Getter and Setter

- (UILabel *)summaryLabel
{
    if (!_summaryLabel) {
        _summaryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _summaryLabel.textColor = VisitsStopScheduleSummaryColor;
        _summaryLabel.font = [UIFont systemFontOfSize:VisitsStopScheduleSummaryFontSize];
    }
    return _summaryLabel;
}

- (UIImageView *)summaryIcon
{
    if (!_summaryIcon) {
        _summaryIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, VisitsStopScheduleSummaryHeight, VisitsStopScheduleSummaryHeight)];
        [_summaryIcon setImage:[UIImage imageNamed:@"hospital_visits_stopSchedule"]];
    }
    return _summaryIcon;
}

#pragma mark - Private

- (void)resetLayoutWithWidth:(CGFloat)width
{
    CGRect frame = CGRectZero;
    frame.size = CGSizeMake(width + VisitsStopScheduleSummaryHeight + VisitsStopScheduleSummarySpace * 2, VisitsStopScheduleSummaryHeight);
    self.frame = frame;
    
    frame = self.summaryLabel.frame;
    frame.origin = CGPointMake(VisitsStopScheduleSummaryHeight + VisitsStopScheduleSummarySpace, (VisitsStopScheduleSummaryHeight - CGRectGetHeight(self.summaryLabel.frame)) / 2);
    self.summaryLabel.frame = frame;
    
    self.backgroundColor = [UIColor lightGrayColor];
    self.layer.cornerRadius = VisitsStopScheduleCornerRadius;
}


@end

@interface VisitsStopScheduleView ()
{
    CGFloat _width;
}

@property (nonatomic, strong) UILabel *explainLabel;

@end

@implementation VisitsStopScheduleView

- (id)initWithWidth:(CGFloat)width stopSchedules:(NSArray *)stopSchedules
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _width = width;
        self.explainLabel.text = NSLocalizedString(@"VisitsStopScheduleExplain", nil);
        [self.explainLabel sizeToFit];
        [self addSubview:self.explainLabel];
        [self stopScheduleLayout:stopSchedules];
    }
    return self;
}

#pragma mark - Getter and Setter

- (UILabel *)explainLabel
{
    if (!_explainLabel) {
        _explainLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _explainLabel.textColor = VisitsStopScheduleExplainColor;
        _explainLabel.font = [UIFont systemFontOfSize:VisitsStopScheduleExplainFontSize];
        
    }
    return _explainLabel;
}

#pragma mark - Private

- (void)stopScheduleLayout:(NSArray *)stopSchedules
{
    CGFloat maxY = 0;
    for (int i= 0; i < stopSchedules.count; i++) {
//        NXTFStopScheduleDto *dto = stopSchedules[i];
        NXVisitsStopScheduleItemView *stopSchedule = [[NXVisitsStopScheduleItemView alloc] initWithStopScheduleSummary:@"暂时替代"];
        CGRect frame = stopSchedule.frame;
        frame.origin = CGPointMake(0, CGRectGetMaxY(self.explainLabel.frame) + VisitsStopScheduleSpace + (VisitsStopScheduleSummaryHeight + VisitsStopScheduleSpace) * i);
        stopSchedule.frame = frame;
        [self addSubview:stopSchedule];
        maxY = CGRectGetMaxY(stopSchedule.frame);
    }
    
    self.frame = CGRectMake(0, 0, _width, maxY + VisitsStopScheduleSpace);
}

@end
