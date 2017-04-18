//
//  InspectionReportProjectTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InspectionReportProjectTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleName; //题目
@property (weak, nonatomic) IBOutlet UILabel *timeLabel; //时间
@property (weak, nonatomic) IBOutlet UILabel *personLabel; //人名


@end
