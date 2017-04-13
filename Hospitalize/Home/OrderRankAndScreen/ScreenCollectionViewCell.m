//
//  ScreenCollectionViewCell.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ScreenCollectionViewCell.h"
#import "FCMacros.h"
#import "FCCommonUtil.h"

@interface ScreenCollectionViewCell()

@property (assign, nonatomic) CGRect frame;
@property (strong, nonatomic) UILabel *screenLabel;

@end


@implementation ScreenCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        [self.contentView addSubview:self.screenLabel];
    }
    return self;
}


-(UILabel *)screenLabel{
    if (!_screenLabel) {
        _screenLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _screenLabel.backgroundColor = [UIColor whiteColor];
        _screenLabel.font = [UIFont systemFontOfSize:12];
        _screenLabel.textAlignment = NSTextAlignmentCenter;
        
        _screenLabel.layer.cornerRadius = 4;
        _screenLabel.layer.borderWidth = 1;
        _screenLabel.layer.borderColor = COLORD5D5D5.CGColor;
        _screenLabel.textColor = COLOR666666;

    }
    return _screenLabel;
}

- (void)setNotSelectedTitle:(NSString *)title {
    self.screenLabel.text = title;
    // 未被选择的条件
    _screenLabel.layer.borderColor = COLORD5D5D5.CGColor;
    _screenLabel.textColor = COLOR666666;
    _screenLabel.backgroundColor = [UIColor whiteColor];
}
- (void)setSelectedTitle:(NSString *)title {
    
    self.screenLabel.text = title;
    // 被选择的条件
    self.screenLabel.layer.borderColor = COLORFC7845.CGColor;
    self.screenLabel.textColor = COLORFC7845;
    self.screenLabel.backgroundColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:0/255.0 alpha:0.15];
}

@end
