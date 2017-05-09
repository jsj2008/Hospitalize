//
//  CaseReportApi.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/5/9.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "CaseReportApi.h"

@implementation CaseReportApi


+ (CaseReportApi *) sharedInstance {
    static dispatch_once_t onceToken;
    static CaseReportApi *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[CaseReportApi alloc] init];
    });
    return _instance;
}





@end
