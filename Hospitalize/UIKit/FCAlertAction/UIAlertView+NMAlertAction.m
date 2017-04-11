//
//  UIAlertView+Block.h
//
//
//  Created by 周鑫 on 16/10/27.
//  Copyright © 2016年 chris. All rights reserved.
//

#import "UIAlertView+NMAlertAction.h"
#import <objc/runtime.h>


#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
@implementation UIAlertView (NMAlertAction)
#pragma clang diagnostic pop

static char key;



- (void)showWithBlock:(void(^)(NSInteger buttonIndex))block
{
    if (block) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &key, block, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
   
    [self show];
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void(^block)(NSInteger buttonIndex);
    block = objc_getAssociatedObject(self, &key);
    objc_removeAssociatedObjects(self);
    if (block)
        block(buttonIndex);
}
#pragma clang diagnostic pop





@end
