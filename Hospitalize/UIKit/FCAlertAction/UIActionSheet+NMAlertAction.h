//
//  UIActionSheet+Block.h
//
//
//  Created by 周鑫 on 16/10/27.
//  Copyright © 2016年 chris. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIActionSheet (NMAlertAction)<UIActionSheetDelegate>


- (void)showInView:(UIView *)view block:(void(^)(NSInteger idx,NSString* buttonTitle))block;

@end
