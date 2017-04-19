//
//  CasesListCardTableViewCell.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CasesListCardTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;//头像

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;//姓名

@property (weak, nonatomic) IBOutlet UILabel *hospitalizeIdLabel;//就诊ID

@property (weak, nonatomic) IBOutlet UILabel *hospitalNameLabel;//医院名

@property (weak, nonatomic) IBOutlet UILabel *kesiLabel;//科室名

@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;//医生名

@property (weak, nonatomic) IBOutlet UILabel *hospitalIdLabel;//门诊ID

@property (weak, nonatomic) IBOutlet UILabel *successLabel;//显示挂号成功label

@end
