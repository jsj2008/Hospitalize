//
//  MedicalRecordsContentTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalRecordsContentTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *title; // 内容题目
@property (weak, nonatomic) IBOutlet UILabel *content; // 内容
@property (weak, nonatomic) IBOutlet UIButton *stateButton; // 状态按钮


@end
