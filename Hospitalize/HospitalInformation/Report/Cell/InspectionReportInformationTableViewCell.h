//
//  InspectionReportInformationTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InspectionReportInformationTableViewCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UILabel *titleName; //题目
@property (weak, nonatomic) IBOutlet UILabel *content; //内容
@property (weak, nonatomic) IBOutlet UIImageView *contentImage; //内容图片

@property (weak, nonatomic) IBOutlet UILabel *horizontalLine; //横线

@end
