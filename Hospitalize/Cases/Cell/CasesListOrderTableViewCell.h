//
//  CasesListOrderTableViewCell.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CasesListOrderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;//挂号时间
@property (weak, nonatomic) IBOutlet UILabel *orderCostLabel;//挂号费用
@property (weak, nonatomic) IBOutlet UILabel *isPayLabel;//是否支付label
@property (weak, nonatomic) IBOutlet UIButton *payButton;//支付按钮
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;//取消按钮
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;//就诊位置

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;//病情主述
@property (weak, nonatomic) IBOutlet UIButton *checkinButton;

@end
