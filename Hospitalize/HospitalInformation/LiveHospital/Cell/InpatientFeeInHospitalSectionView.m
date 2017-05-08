//
//  InpatientFeeInHospitalSectionView.m
//
//  Created by 周鑫 on 15/10/19.
//  Copyright © 2015年 HZTeam. All rights reserved.
//

#import "InpatientFeeInHospitalSectionView.h"

@implementation InpatientFeeInHospitalSectionView

- (id)init {
    self = [super init];
    if (self) {
        // 初始化时加载InpatientFeeInHospitalSectionView.xib
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"InpatientFeeInHospitalSectionView" owner:self options:nil];
        
        // 如果路径不对，return nil
        if (arrayOfViews.count < 1) {
            return nil;
        }
        
        // 如果xib中view不属于 UIView 类，return nil
        if (![arrayOfViews.firstObject isKindOfClass:[UIView class]])
        {
            return nil;
        }
        
        // 加载nib
        self = arrayOfViews.firstObject;
        
        
        UITapGestureRecognizer *tapYesterdayView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionViewInHospitalTapGesture:)];
        _yesterdayView.tag                       = kTagYesterdayView;
        [_yesterdayView addGestureRecognizer:tapYesterdayView];
        
        UITapGestureRecognizer *tapTodayView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionViewInHospitalTapGesture:)];
        _todayView.tag                           = kTagTodayView;
        [_todayView addGestureRecognizer:tapTodayView];
        
        UITapGestureRecognizer *tapTomorrowView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionViewInHospitalTapGesture:)];
        _tomorrowView.tag                        = kTagTomorrowView;
        [_tomorrowView addGestureRecognizer:tapTomorrowView];
        
    }
    return self;
}

- (void)sectionViewInHospitalTapGesture:(UITapGestureRecognizer *)tap {
    
    if ([self.delegate respondsToSelector:@selector(inpatientFeeInHospitalSectionViewDelegate:)]) {
        
        [self.delegate inpatientFeeInHospitalSectionViewDelegate:tap.view.tag];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
