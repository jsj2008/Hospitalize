//
//  CasesListRecipeTableViewCell.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "CasesListRecipeTableViewCell.h"
#import "CasesListRecipeCellTableViewCell.h"

@interface CasesListRecipeTableViewCell ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation CasesListRecipeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.recipeTableView.delegate = self;
    self.recipeTableView.dataSource = self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CasesListRecipeCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CasesListRecipeCellTableViewCell" forIndexPath:indexPath];
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
