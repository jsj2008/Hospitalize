//
//  ScreenCollectionReusableView.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenCollectionReusableView : UICollectionReusableView


@property (nonatomic, strong) UILabel *cityNameLabel;//城市名称
@property (nonatomic, strong) UILabel *gpsLabel;//gps定位
@property (nonatomic, strong) UIButton *locationButton;//重新定位

@property (strong, nonatomic) UILabel *sectionTitleLabel;//section头lable

@property (strong, nonatomic) UILabel *selectedMsgLabel;//显示相应的选择label
@property (strong, nonatomic) UIButton *moreButton;//点击拉下箭头

//是否显示定位
- (void)showCityArea:(BOOL)shouldShow;

//设置选中后显示颜色
-(void)setSelecedMesLabelColor;

@end
