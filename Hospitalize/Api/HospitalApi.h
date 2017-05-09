//
//  HospitalApi.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/5/9.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NioxCore/NioxCore.h>



typedef void(^ResultBlock)(id result);
typedef void(^ErrorBlock)(NSError *error);

@interface HospitalApi : NSObject

+ (HospitalApi *) sharedInstance;

/**
 根据城市获取医院列表请求信息
 
 @param cityCode 城市code
 @param resultBlock 回调
 @param errorBlock 回调
 */
-(void)GetBannersReqWithCityCode:(NSString *)cityCode resultBlock:(ResultBlock)resultBlock error:(ErrorBlock)errorBlock;

@end
