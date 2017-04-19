//
//  MedicalRecordsReportTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalRecordsReportTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title; // 报告题目
@property (weak, nonatomic) IBOutlet UILabel *content; // 报告描述
@property (weak, nonatomic) IBOutlet UIView *reportView; // 报告View
@property (weak, nonatomic) IBOutlet UILabel *reportTitle; // 报告的标题
@property (weak, nonatomic) IBOutlet UIImageView *reportRight; // 报告箭头
@property (weak, nonatomic) IBOutlet UIButton *reportButton; // 报告按钮

@end
