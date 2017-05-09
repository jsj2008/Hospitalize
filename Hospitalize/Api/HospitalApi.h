//
//  HospitalApi.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/5/9.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ResultBlock)(id result);
typedef void(^ErrorBlock)(NSError *error);

@interface HospitalApi : NSObject

+ (HospitalApi *) sharedInstance;

@end
