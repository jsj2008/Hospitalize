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






/**
 获取我的地址列表
 
 @param page        page
 @param isDefault   默认地址(1:只默认地址 0:全部(DEF))
 @param resultBlock 回调
 @param errorBlock  回调
 */
-(void)getMtShipAddsReqWith:(NMTFPage *)page isDefault:(int32_t)isDefault resultBlock:(ResultBlock)resultBlock error:(ErrorBlock)errorBlock{
    NMTFGetMtShipAddsReq *request  =[[NMTFGetMtShipAddsReq alloc]initWithHeader:[NMEmartClientManager getHeader:YES] page:page isDefault:isDefault];
    [[NMEmartClientManager sharedClient]addToQuene:request selName:@"getMtShipAdds:" success:^(id content) {
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
