//
//  MPLocationManager.h
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/14.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^KSystemLocationBlock)(CLLocation *loction, NSError *error);

@interface MPLocationManager : NSObject

+ (id)shareInstance;
/**
 *  启动系统定位
 *
 *  @param systemLocationBlock 系统定位成功或失败回调成功
 */
- (void)startSystemLocationWithRes:(KSystemLocationBlock)systemLocationBlock;

@end
