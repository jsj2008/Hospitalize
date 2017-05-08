//
//  InpatientFeeInHospitalSectionView.h
//
//  Created by 周鑫 on 15/10/19.
//  Copyright © 2015年 HZTeam. All rights reserved.
//  住院中住院费SectionView

#import <UIKit/UIKit.h>

#define kTagYesterdayView   100
#define kTagTodayView       101
#define kTagTomorrowView    102

@protocol InpatientFeeInHospitalSectionViewDelegate <NSObject>

- (void)inpatientFeeInHospitalSectionViewDelegate:(NSInteger)tag;

@end

@interface InpatientFeeInHospitalSectionView : UIView

@property (weak, nonatomic) IBOutlet UIView         *yesterdayView;
@property (weak, nonatomic) IBOutlet UIImageView    *yesterdayImgView;
@property (weak, nonatomic) IBOutlet UILabel        *yesterdayTotalCostLabel;

@property (weak, nonatomic) IBOutlet UIView         *todayView;
@property (weak, nonatomic) IBOutlet UILabel        *todayLabel;
@property (weak, nonatomic) IBOutlet UILabel        *todayTotalCostLabel;

@property (weak, nonatomic) IBOutlet UIView         *tomorrowView;
@property (weak, nonatomic) IBOutlet UIImageView    *tomorrowImgView;
@property (weak, nonatomic) IBOutlet UILabel        *tomorrowTotalCostLabel;

@property (nonatomic, weak) id <InpatientFeeInHospitalSectionViewDelegate>delegate;

@end
