//
//  NXInpatientFeeListViewController.h
//  Niox
//
//  Created by 侯明和 on 15/10/21.
//  Copyright © 2015年 neusoft. All rights reserved.
//

#import "BaseViewController.h"
@protocol NXInpatientFeeListViewControllerDelegate <NSObject>

- (void)selectDate:(NSString *)dateStr isRefursh:(BOOL)isRefursh status:(NSInteger) status;

@end
@interface NXInpatientFeeListViewController : BaseViewController

typedef NS_ENUM(NSInteger,STATEFROM_CALENDAR) {
    INPATIENT_REFRESH = 0,  //住院中，需要刷新
    OUTPATIENT_REFRESH,     //已出院，需要刷新
    INPATIENT_NOTREFRESH,   //住院中，不需要刷新
    OUTPATIENT_NOTREFRESH   //已出院，不需要刷新
};
@property (nonatomic, assign) STATEFROM_CALENDAR state_refresh;

@property (nonatomic ,assign) id<NXInpatientFeeListViewControllerDelegate>delegate;
@property (nonatomic ,  copy) NSString *hospId;
@property (nonatomic ,  copy) NSString *recordId;
@property (nonatomic ,  copy) NSString *patientId;

// 是否已出院 按日历查询住院费（不是不用传下面两个参数）
@property (nonatomic, assign) BOOL leaveHospitalQuery;
//@property (nonatomic, strong) NXTFInpatientInfo *tfInpatientInfo;

@end

