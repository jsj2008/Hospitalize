//
//  NXCustomLeftBarButtonItem.m
//  Anymed
//
//  Created by neu on 15/5/21.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "NXCustomLeftBarButtonItem.h"

@implementation NXCustomLeftBarButtonItem {
    
    UILabel *titleLabel;
}

- (instancetype)initWithTitle:(NSString *)title {
    
    self = [super init];
    if (self) {
        
        titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.text = title;
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        
        _rightImageView = [[UIImageView alloc]init];
        _rightImageView.image = [UIImage imageNamed:@"home_itme_positioning"];
        [self addSubview:_rightImageView];
        
        _clickButton = [[UIButton alloc]init];
        [self addSubview:_clickButton];
        
        [self updateFrame];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title {
    
    if (title.length < 1) {
        title = @"选地区";
    }
    
    if (title.length > 4) {
        title = [title substringToIndex:4];
        title = [title stringByAppendingString:@"..."];
    }
    
    titleLabel.text = title;
    [self updateFrame];
}

- (void)updateFrame {
    
    self.bounds = CGRectMake(0, 0, [self getStringWidthWithString:titleLabel.text font:titleLabel.font] + 20, 30);
    
    _rightImageView.frame = CGRectMake(0, (30-16)/2, 16, 16);
    titleLabel.frame = CGRectMake(16 + 4,
                                  0,
                                  [self getStringWidthWithString:titleLabel.text font:titleLabel.font],
                                  self.bounds.size.height);
    
    _clickButton.frame = self.bounds;
}

- (float)getStringWidthWithString:(NSString *)aString font:(UIFont *)aFont {
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:aFont forKey:NSFontAttributeName];
    CGRect aStringRect = [aString boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil];
    return aStringRect.size.width;
}

@end
