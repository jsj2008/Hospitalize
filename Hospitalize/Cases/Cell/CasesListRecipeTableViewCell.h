//
//  CasesListRecipeTableViewCell.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CasesListRecipeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITableView *recipeTableView;//tableview

@property (weak, nonatomic) IBOutlet UILabel *recipNumLabel;//处方号

@property (weak, nonatomic) IBOutlet UILabel *isPayLabel;//是否已支付

@property (weak, nonatomic) IBOutlet UILabel *totalNumLabel;//共多少件商品

@property (weak, nonatomic) IBOutlet UILabel *totalCostLabel;//总费用

@property (weak, nonatomic) IBOutlet UIButton *payButton;//支付按钮

@end
