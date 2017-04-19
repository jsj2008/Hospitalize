//
//  CasesListReportCellTableViewCell.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CasesListReportCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;//项目名
@property (weak, nonatomic) IBOutlet UILabel *isOKlabel;//是否已出报告
@property (weak, nonatomic) IBOutlet UIImageView *jiantouImageView;//箭头的图片

@end
