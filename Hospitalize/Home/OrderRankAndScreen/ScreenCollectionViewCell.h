//
//  ScreenCollectionViewCell.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenCollectionViewCell : UICollectionViewCell

//未被选中的样式
- (void)setNotSelectedTitle:(NSString *)title;
//被选中的样式
- (void)setSelectedTitle:(NSString *)title;

@end
