//
//  HospitalApi.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/5/9.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalApi.h"

@implementation HospitalApi


+ (HospitalApi *) sharedInstance {
    static dispatch_once_t onceToken;
    static HospitalApi *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[HospitalApi alloc] init];
    });
    return _instance;
}



@end
