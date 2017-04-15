//
//  OrderCostLsitHeaderView.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderCostLsitHeaderView.h"
#import "UIView+Extension.h"

@implementation OrderCostLsitHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self ==[super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"zhifuqueren_no"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"zhifuqueren"] forState:UIControlStateSelected];
        
        button.centerY = self.centerY;
        button.x = 15;
        
        [self.contentView addSubview:button];
        self.contentView.backgroundColor = [UIColor redColor];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
