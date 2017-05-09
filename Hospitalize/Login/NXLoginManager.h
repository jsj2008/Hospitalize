//
//  NXLoginManager.h
//  Anymed
//
//  Created by sunyw on 15/6/9.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NioxCore/NioxCore.h>

@interface NXLoginManager : NSObject

+ (instancetype)sharedNXLoginManager;

- (void) doLogin:(AMMGesUserInfo *)inputModel;

@end
