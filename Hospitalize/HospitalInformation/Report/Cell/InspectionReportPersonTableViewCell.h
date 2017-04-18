//
//  InspectionReportPersonTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InspectionReportPersonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *sendDoctor; //送检医师
@property (weak, nonatomic) IBOutlet UILabel *sendDoctorName; //送检人
@property (weak, nonatomic) IBOutlet UILabel *department; //送检科室
@property (weak, nonatomic) IBOutlet UILabel *departmentName; //送检科室名
@property (weak, nonatomic) IBOutlet UILabel *checkDoctor; //检查医生
@property (weak, nonatomic) IBOutlet UILabel *checkDoctorName; //检查医生名
@property (weak, nonatomic) IBOutlet UILabel *reviewDoctor; //审核医生
@property (weak, nonatomic) IBOutlet UILabel *reviewDoctorName; //审核医生名

@property (weak, nonatomic) IBOutlet UILabel *promptInformation; //横线


@end
