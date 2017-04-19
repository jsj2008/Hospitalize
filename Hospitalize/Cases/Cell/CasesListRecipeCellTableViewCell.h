//
//  CasesListRecipeCellTableViewCell.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CasesListRecipeCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;//项目label
@property (weak, nonatomic) IBOutlet UILabel *costLabel;//花费
@property (weak, nonatomic) IBOutlet UILabel *numLabel;//数量

@end
