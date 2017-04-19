//
//  VisitsScheduleView.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisitsScheduleView : UIView

- (id)initWithWidth:(CGFloat)width Schedule:(NSArray *)schedule date:(NSArray *)dates;

@end


@interface NXVisitsScheduleItemView : UIView

@end
