//
//  OrderRankView.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OrderRankResultDelegate <NSObject>

- (void)orderResultId:(NSInteger)orderById;
- (void)orderResultCancel;

@end
@interface OrderRankView : UIView

@property (nonatomic, weak) id <OrderRankResultDelegate> delegate;

@property (nonatomic,retain) NSArray *rowNameArray;//每行对应的行名

@property (nonatomic, assign) BOOL show;//是否在显示状态

@property (nonatomic,assign) int hightLightRow;//显示高亮行，0默认没有高亮行

-(instancetype)initWithStartY:(CGFloat)startY;
//显示
-(void)orderRank;

@end
