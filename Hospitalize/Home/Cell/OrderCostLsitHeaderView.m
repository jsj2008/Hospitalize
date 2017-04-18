//
//  OrderCostLsitHeaderView.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderCostLsitHeaderView.h"
#import "UIView+Extension.h"
#import "FCMacros.h"
#import "FCCommonUtil.h"

@implementation OrderCostLsitHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self ==[super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        _showButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_showButton setImage:[UIImage imageNamed:@"zhifuqueren_no"] forState:UIControlStateNormal];
        [_showButton setImage:[UIImage imageNamed:@"zhifuqueren"] forState:UIControlStateSelected];
        _showButton.frame = CGRectMake(15, 16, 44,44);
        _showButton.center = CGPointMake(22.5, 26);
        _showButton.userInteractionEnabled = NO;
        [self.contentView addSubview:_showButton];
        

        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(42, 16, 300, 18)];
        label.font = [UIFont systemFontOfSize:16.0];
        label.textColor = COLOR333333;
        label.text = @"门诊流水号：153657";
        [self.contentView addSubview:label];
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(KmainScreenWidth-100-15, 15, 100, 18)];
        
        timeLabel.font = [UIFont systemFontOfSize:12];
        timeLabel.textAlignment = NSTextAlignmentRight;
        timeLabel.textColor = COLOR949A9E;
        timeLabel.text = @"07.05";
        [self.contentView addSubview:timeLabel];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,50-0.5, KmainScreenWidth, 0.5)];
        lineView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
        [self.contentView addSubview:lineView];
        
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.frame = CGRectMake(0, 0, KmainScreenWidth, 50);
        [self.contentView addSubview:_selectButton];
        
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
