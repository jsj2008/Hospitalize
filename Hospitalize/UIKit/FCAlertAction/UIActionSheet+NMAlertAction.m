//
//  UIActionSheet+Block.m
//
//
//  Created by 周鑫 on 16/10/27.
//  Copyright © 2016年 chris. All rights reserved.
//

#import "UIActionSheet+NMAlertAction.h"
#import <objc/runtime.h>

static char key;
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
@implementation UIActionSheet (NMAlertAction)
#pragma clang diagnostic pop



- (void)showInView:(UIView *)view block:(void(^)(NSInteger idx,NSString* buttonTitle))block
{
    if (block) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &key, block, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self showInView:view];
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void(^block)(NSInteger idx,NSString* buttonTitle);
    block = objc_getAssociatedObject(self, &key);
    objc_removeAssociatedObjects(self);
    if (block) {
        block(buttonIndex,[self buttonTitleAtIndex:buttonIndex]);
    }
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    
}

#pragma clang diagnostic pop




@end
