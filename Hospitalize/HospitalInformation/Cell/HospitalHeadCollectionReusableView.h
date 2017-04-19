//
//  HospitalHeadCollectionReusableView.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalHeadCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *hospitaImageView; // 医院图片
@property (weak, nonatomic) IBOutlet UIImageView *addressImageView; // 地址图片
@property (weak, nonatomic) IBOutlet UILabel *address; // 地址
@property (weak, nonatomic) IBOutlet UIButton *telButton; // 电话按钮
@property (weak, nonatomic) IBOutlet UIView *hospitalView; // 半透明View
@property (weak, nonatomic) IBOutlet UILabel *dayNumTitle; // 日门诊量
@property (weak, nonatomic) IBOutlet UILabel *dayNum; // 日门诊量数量
@property (weak, nonatomic) IBOutlet UILabel *acceptsAmount; // 接诊量
@property (weak, nonatomic) IBOutlet UILabel *acceptsAmountNum; // 接诊量数量
@property (weak, nonatomic) IBOutlet UILabel *hospitalDepartment; // 科室


@end
