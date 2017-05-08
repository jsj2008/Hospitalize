//
//  NetworkConfigure.h
//  NioxCore
//
//  Created by duanxiaochen on 2016/11/8.
//  Copyright © 2016年 DC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConfigure : NSObject

@property (nonatomic , copy) NSString *networkTFHostname;
@property (nonatomic , assign) UInt32 networkTFCommonport;
@property (nonatomic , assign) UInt32 networkTFSSLport;
@property (nonatomic , copy) NSString *networkNioxAppVersion;

+ (NetworkConfigure *)shareConfigure;

@end
