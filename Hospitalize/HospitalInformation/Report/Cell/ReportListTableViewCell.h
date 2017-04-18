//
//  ReportListTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *checkProject; //检查项目
@property (weak, nonatomic) IBOutlet UILabel *timeLabel; //检查时间
@property (weak, nonatomic) IBOutlet UILabel *stateLabel; //报告状态
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stateRightConstraint; //状态距右侧间距

@end
