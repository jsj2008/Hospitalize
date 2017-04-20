//
//  MemberTableViewCell.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberTableViewCell : UITableViewCell
//用户头像
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;
//是否是本人
@property (weak, nonatomic) IBOutlet UILabel *userPersonLabel;
//姓名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//性别
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
//年龄
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
//证件号码
@property (weak, nonatomic) IBOutlet UILabel *idcardNumLabel;
//电话
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;

@end
