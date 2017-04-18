//
//  MedicalRecordsPersonTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalRecordsPersonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *lineImageView; // 横线
@property (weak, nonatomic) IBOutlet UIImageView *porImageView; // 头像
@property (weak, nonatomic) IBOutlet UILabel *nameLabel; // 名字
@property (weak, nonatomic) IBOutlet UILabel *ageLabel; // 岁数
@property (weak, nonatomic) IBOutlet UILabel *marriageLabel; // 婚姻
@property (weak, nonatomic) IBOutlet UILabel *idLabel; // 就诊ID
@property (weak, nonatomic) IBOutlet UIImageView *hospitalImageView; // 医院图片
@property (weak, nonatomic) IBOutlet UILabel *hospitalName; // 医院名称
@property (weak, nonatomic) IBOutlet UIImageView *departmentImageView; // 科室图片
@property (weak, nonatomic) IBOutlet UILabel *departmentName; // 科室名称
@property (weak, nonatomic) IBOutlet UIImageView *doctorImageView; // 医生图片
@property (weak, nonatomic) IBOutlet UILabel *doctorName; // 医生名称
@property (weak, nonatomic) IBOutlet UILabel *state; // 状态
@property (weak, nonatomic) IBOutlet UIImageView *rightImage; // 费用图片
@property (weak, nonatomic) IBOutlet UILabel *cost; // 费用
@property (weak, nonatomic) IBOutlet UIButton *sumCostButton; // 费用按钮












@end
