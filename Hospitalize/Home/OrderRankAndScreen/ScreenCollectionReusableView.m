//
//  ScreenCollectionReusableView.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ScreenCollectionReusableView.h"
#import "FCMacros.h"
#import "FCCommonUtil.h"

#define SectionViewHeight 30
#define ButtonWidth 80

@interface ScreenCollectionReusableView ()

@property (nonatomic,assign) CGRect frame;
@end

@implementation ScreenCollectionReusableView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.sectionTitleLabel];
        
        [self addSubview:self.selectedMsgLabel];
        [self addSubview:self.moreButton];
        
        [self addSubview:self.cityNameLabel];
        [self addSubview:self.locationButton];
        
        [self addSubview:self.gpsLabel];
        self.frame = frame;
    }
    return self;
}

- (UILabel *)cityNameLabel {
    
    if (_cityNameLabel == nil) {
        _cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (45-39)/2, 200, 39)];
        _cityNameLabel.font = [UIFont systemFontOfSize:16];
        _cityNameLabel.textColor = COLOR333333;
        _cityNameLabel.textAlignment = NSTextAlignmentLeft;
        _cityNameLabel.text = @"定位";
        _cityNameLabel.hidden = NO;
    }
    
    return _cityNameLabel;
}
- (UILabel *)gpsLabel {
    
    if (_gpsLabel == nil) {
        _gpsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15+30, (45-39)/2, 200, 39)];
        _gpsLabel.font = [UIFont systemFontOfSize:12];
        _gpsLabel.textColor = COLOR949A9E;
        _gpsLabel.textAlignment = NSTextAlignmentLeft;
        _gpsLabel.text = @"GPS定位";
        _gpsLabel.hidden = NO;
    }
    
    return _gpsLabel;
}

- (UIButton *)locationButton {
    
    if (_locationButton == nil) {
        _locationButton = [[UIButton alloc] initWithFrame:CGRectMake(KmainScreenWidth-15-80-40,(_frame.size.height-39)/2+3, 80, 39)];
        [_locationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _locationButton.titleLabel.textColor = [UIColor blackColor];
        _locationButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_locationButton setTitle:@"重新定位" forState:UIControlStateNormal];
        [_locationButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 2)];
        _locationButton.hidden = NO;
    }
    return _locationButton;
}

- (UIButton *)moreButton {
    
    if (_moreButton == nil) {
        _moreButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-ButtonWidth-5, 0, ButtonWidth, SectionViewHeight)];
        [_moreButton setTitleColor:COLOR666666 forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _moreButton.backgroundColor = [UIColor clearColor];
        [_moreButton setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateSelected];
        
        [_moreButton setImageEdgeInsets:UIEdgeInsetsMake(0, ButtonWidth-12, 0, 0)];
    }
    
    return _moreButton;
}

- (UILabel *)sectionTitleLabel {
    
    if (_sectionTitleLabel == nil) {
        
        _sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-5*2, SectionViewHeight)];
        _sectionTitleLabel.backgroundColor = [UIColor whiteColor];
        _sectionTitleLabel.font = [UIFont systemFontOfSize:12];
        _sectionTitleLabel.textColor = COLOR666666;
        _sectionTitleLabel.textAlignment = NSTextAlignmentLeft;

    }
    
    return _sectionTitleLabel;
}
- (UILabel *)selectedMsgLabel {
    
    if (_selectedMsgLabel == nil) {
        
        _selectedMsgLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-ButtonWidth-5-15, 0, ButtonWidth, SectionViewHeight)];
        _selectedMsgLabel.backgroundColor = [UIColor whiteColor];
        _selectedMsgLabel.font = [UIFont systemFontOfSize:12];
        _selectedMsgLabel.textColor = COLOR666666;
        _selectedMsgLabel.textAlignment = NSTextAlignmentRight;
        _selectedMsgLabel.text = @"不限";
    }
    
    return _selectedMsgLabel;
}

- (void)showCityArea:(BOOL)shouldShow {
    self.selectedMsgLabel.hidden = shouldShow;
    self.gpsLabel.hidden = !shouldShow;
    self.cityNameLabel.hidden = !shouldShow;
    self.locationButton.hidden = !shouldShow;
}

-(void)setSelecedMesLabelColor{
    self.selectedMsgLabel.textColor = COLORFC7845;
}

@end
