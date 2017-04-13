//
//  HomeItmeTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeItmeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *makeAnAppointmentButton;//预约挂号
@property (weak, nonatomic) IBOutlet UIButton *onlineConsultingButton;//在线咨询
@property (weak, nonatomic) IBOutlet UIButton *internetOfficeButton;//互联网诊室
@property (weak, nonatomic) IBOutlet UIButton *myCollectionButton;//我的收藏

@end
