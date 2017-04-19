//
//  NXCustomLeftBarButtonItem.h
//  Anymed
//
//  Created by neu on 15/5/21.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXCustomLeftBarButtonItem : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIButton *clickButton;

- (instancetype)initWithTitle:(NSString *)title;

- (void)setTitle:(NSString *)title;

@end
