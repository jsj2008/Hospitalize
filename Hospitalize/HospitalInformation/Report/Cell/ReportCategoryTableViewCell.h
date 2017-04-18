//
//  ReportCategoryTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportCategoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *line1; //竖线1
@property (weak, nonatomic) IBOutlet UILabel *line2; //竖线2
@property (weak, nonatomic) IBOutlet UIImageView *projectImageView; //项目图片
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *projectLeftConstraint; //项目名称距左侧距离
@property (weak, nonatomic) IBOutlet UILabel *projectContent; //项目名称
@property (weak, nonatomic) IBOutlet UILabel *resultLabel; //结果
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView; //结果图片
@property (weak, nonatomic) IBOutlet UILabel *referenceValue; //参考值

@property (weak, nonatomic) IBOutlet UILabel *horizontalLine; //横线



@end
