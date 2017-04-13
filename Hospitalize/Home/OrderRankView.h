//
//  OrderRankView.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderRankView : UIView


@property (nonatomic, assign) BOOL show;

-(instancetype)initWithStartY:(CGFloat)startY;

-(void)orderRank;
@end
