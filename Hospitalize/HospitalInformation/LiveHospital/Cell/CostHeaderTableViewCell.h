//
//  CostHeaderTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/25.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CostHeaderTableViewCell : UITableViewCell<UITableViewDataSource, UITableViewDelegate>



@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property(nonatomic, assign)int number;

-(void)reloadCell;

@end
