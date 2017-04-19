//
//  CasesListReportTableViewCell.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectBlock)(int row);

@interface CasesListReportTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITableView *reportTableView;

/**
 传递点击事件
 */
@property (nonatomic,copy)SelectBlock selectBlock;
/**
 传递点击事件
 */
- (void)selectBlock:(SelectBlock)block;

@end
