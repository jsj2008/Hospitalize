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




/**
 根据城市获取医院列表请求信息

 @param cityCode 城市code
 @param resultBlock 回调
 @param errorBlock 回调
 */
-(void)GetBannersReqWithCityCode:(NSString *)cityCode resultBlock:(ResultBlock)resultBlock error:(ErrorBlock)errorBlock{
    NMTFGetMtBannersReq *request = [[NMTFGetMtBannersReq alloc] initWithHeader:[NMEmartClientManager getHeader:YES]];
    [[NMEmartClientManager sharedClient] addToQuene:request selName:@"getBanners:" success:^(id content) {
        if (resultBlock) {
            resultBlock(content);
        }
    } failure:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}



@end
