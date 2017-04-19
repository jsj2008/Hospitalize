//
//  CasesListReportTableViewCell.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "CasesListReportTableViewCell.h"
#import "CasesListReportCellTableViewCell.h"


@interface CasesListReportTableViewCell () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation CasesListReportTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.reportTableView.dataSource = self;
    self.reportTableView.delegate = self;
    
    
    // Initialization code
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CasesListReportCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CasesListReportCellTableViewCell"];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectBlock != nil) {
        self.selectBlock((int)indexPath.row);
    }
    
}
-(void)selectBlock:(SelectBlock)block{
    self.selectBlock = block;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
