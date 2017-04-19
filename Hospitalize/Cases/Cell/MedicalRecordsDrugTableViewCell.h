//
//  MedicalRecordsDrugTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalRecordsDrugTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title; // 题目
@property (weak, nonatomic) IBOutlet UILabel *drug; // 药品
@property (weak, nonatomic) IBOutlet UILabel *drugContent; // 药品内容
@property (weak, nonatomic) IBOutlet UILabel *guidelines; // 用药指导
@property (weak, nonatomic) IBOutlet UILabel *guidelinesContent; // 用药指导内容


@end
