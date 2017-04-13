//
//  DepartmentsTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepartmentsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;//头像
@property (weak, nonatomic) IBOutlet UILabel *departmentsName;//科室名称
@property (weak, nonatomic) IBOutlet UILabel *professionalTitleName;//职称
@property (weak, nonatomic) IBOutlet UILabel *acceptsTheAmount;//接诊量
@property (weak, nonatomic) IBOutlet UIImageView *starImageView1;//星星1
@property (weak, nonatomic) IBOutlet UIImageView *starImageView2;//星星2
@property (weak, nonatomic) IBOutlet UIImageView *starImageView3;//星星3
@property (weak, nonatomic) IBOutlet UIImageView *starImageView4;//星星4
@property (weak, nonatomic) IBOutlet UIImageView *starImageView5;//星星5




@end
