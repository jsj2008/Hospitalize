//
//  PersonApi.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/5/8.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NioxCore/NioxCore.h>



typedef void(^ResultBlock)(id result);
typedef void(^ErrorBlock)(NSError *error);

@interface PersonApi : NSObject

+ (PersonApi *) sharedInstance;

@end
