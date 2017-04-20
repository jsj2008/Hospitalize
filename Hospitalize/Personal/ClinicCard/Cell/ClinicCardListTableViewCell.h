//
//  ClinicCardListTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClinicCardListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *bigBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *hospitalIconView;
@property (weak, nonatomic) IBOutlet UILabel *hospitalName;
@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;
@property (weak, nonatomic) IBOutlet UILabel *numberTitle;
@property (weak, nonatomic) IBOutlet UILabel *number;




@end
