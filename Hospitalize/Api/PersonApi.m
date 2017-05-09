//
//  PersonApi.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/5/8.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "PersonApi.h"

@implementation PersonApi


+ (PersonApi *) sharedInstance {
    static dispatch_once_t onceToken;
    static PersonApi *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[PersonApi alloc] init];
    });
    return _instance;
}


@end
