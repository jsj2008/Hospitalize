//
//  CostHeaderTableViewCell.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/25.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "CostHeaderTableViewCell.h"
#import "HospitalCostTableViewCell.h"

@implementation CostHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)reloadCell{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.number;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HospitalCostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalCostTableViewCell" forIndexPath:indexPath];
    return cell;
}

@end
