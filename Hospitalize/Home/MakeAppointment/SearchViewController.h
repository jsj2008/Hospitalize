//
//  SearchViewController.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/13.
//  Copyright © 2017年 feichang. All rights reserved.
//  搜索

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

#define SEARCH_HISTORY_KEY @"SearchHistoryKey"


@interface SearchViewController : BaseViewController


@property(nonatomic,copy)NSString *cityName;//城市名称
@property(nonatomic,copy)NSString *cityCode;//城市编码



@end
