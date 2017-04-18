//
//  CasesListTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CasesListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *addressLabel; // 地址
@property (weak, nonatomic) IBOutlet UIImageView *yuandian; // 圆点
@property (weak, nonatomic) IBOutlet UILabel *timeLabel; // 时间

@property (weak, nonatomic) IBOutlet UIView *contentBigView; // 病例View
@property (weak, nonatomic) IBOutlet UILabel *line; // 横线
@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel; // 医院
@property (weak, nonatomic) IBOutlet UILabel *typeLabel; // 类型
@property (weak, nonatomic) IBOutlet UIImageView *departmentImageView; // 科室图片
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel; // 科室名称
@property (weak, nonatomic) IBOutlet UIImageView *doctorImageView; // 医生图片
@property (weak, nonatomic) IBOutlet UILabel *doctorName; // 医生名称
@property (weak, nonatomic) IBOutlet UIImageView *costImageView; // 费用图片
@property (weak, nonatomic) IBOutlet UILabel *costlabel; // 费用
@property (weak, nonatomic) IBOutlet UILabel *costType; // 费用类型
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *costTopConstraint; // 费用图片距离科室图片的距离






@end
