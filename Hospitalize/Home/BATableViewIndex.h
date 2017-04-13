//
//  BATableViewIndex.h
//  QuCai
//
//  Created by 周鑫 on 15/11/12.
//  Copyright © 2015年 qucai. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BATableViewIndexDelegate;

@interface BATableViewIndex : UIView

@property (nonatomic, strong) NSArray *indexes;
@property (nonatomic, weak) id <BATableViewIndexDelegate> tableViewIndexDelegate;

@end

@protocol BATableViewIndexDelegate <NSObject>

/**
 *  触摸到索引时触发
 *
 *  @param tableViewIndex 触发didSelectSectionAtIndex对象
 *  @param index          索引下标
 *  @param title          索引文字
 */
- (void)tableViewIndex:(BATableViewIndex *)tableViewIndex didSelectSectionAtIndex:(NSInteger)index withTitle:(NSString *)title;

/**
 *  开始触摸索引
 *
 *  @param tableViewIndex 触发tableViewIndexTouchesBegan对象
 */
- (void)tableViewIndexTouchesBegan:(BATableViewIndex *)tableViewIndex;
/**
 *  触摸索引结束
 *
 *  @param tableViewIndex
 */
- (void)tableViewIndexTouchesEnd:(BATableViewIndex *)tableViewIndex;

/**
 *  TableView中右边右边索引title
 *
 *  @param tableViewIndex 触发tableViewIndexTitle对象
 *
 *  @return 索引title数组
 */
- (NSArray *)tableViewIndexTitle:(BATableViewIndex *)tableViewIndex;

@end