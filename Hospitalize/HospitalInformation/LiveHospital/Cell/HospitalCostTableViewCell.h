//
//  HospitalCostTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/24.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalCostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *tuiImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;




@end
