//
//  HomeHospitalizeTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/13.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeHospitalizeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *hospitalizeImageView;//医院图片
@property (weak, nonatomic) IBOutlet UILabel *hospitalizeName;//医院名称
@property (weak, nonatomic) IBOutlet UILabel *hospitalizeTitle1;//医院标题
@property (weak, nonatomic) IBOutlet UILabel *hospitalizeTitle2;//医院标题
@property (weak, nonatomic) IBOutlet UILabel *hospitalizeTitle3;//医院标题

@end
