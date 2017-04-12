//
//  UIAlertView+Block.h
//
//
//  Created by 周鑫 on 16/10/27.
//  Copyright © 2016年 chris. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface UIAlertView (NMAlertAction)

// 用Block的方式回调，这时候会默认用self作为Delegate
- (void)showWithBlock:(void(^)(NSInteger buttonIndex)) block;




@end
