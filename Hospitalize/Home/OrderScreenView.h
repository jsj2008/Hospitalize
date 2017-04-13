//
//  OrderScreenView.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderScreenView : UIView

- (instancetype)initWithStartY:(CGFloat)startY;

@property (nonatomic, assign) BOOL show;

-(void)orderScreen;

@end
