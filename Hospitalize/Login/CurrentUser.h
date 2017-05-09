//
//  CurrentUser.h
//  Anymed
//
//  Created by neu on 15/3/23.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CurrentUser : NSObject

@property (nonatomic, strong) NSString *selectedCityName;

@property (nonatomic, strong) NSString *selectedCityCode;

@property (nonatomic, strong) NSString *locationCityName;

@property (nonatomic, strong) NSString *locationCityCode;

@property (strong, nonatomic) NSString *longitude;

@property (strong, nonatomic) NSString *latitude;

@property (assign, nonatomic) BOOL didSignIn;

@property (nonatomic,copy) NSString *userId;

@property (nonatomic,copy) NSString *token;

@property (nonatomic,copy) NSString *patientId;

@property (nonatomic,copy) NSString *signingKey;

@property (nonatomic,copy) NSString *currentUser;

@property (nonatomic,copy) NSString *phoneNo;

@property (nonatomic,assign) int gender;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *accountName;

@property (nonatomic,copy) NSString *headerImageUrl;

@property (nonatomic,copy) NSString *currentPatientId;
// 登录注册保存手机号
@property (nonatomic,copy) NSString *registerPhoneNo;

@property (nonatomic,copy) NSString *merchantNo;

// 昵称
@property (nonatomic,copy) NSString *nickName;

//腾讯云帐号
@property (nonatomic, copy) NSString *tImid;  //腾讯云关联账号
@property (nonatomic, copy) NSString *tImToken; //腾讯云关联账号Token


/**
 *  单例模式，当前的用户
 *
 *  @return 当前的用户
 */
+ (CurrentUser *)sharedUser;

/**
 *  将当前的用户信息设为空值
 */
- (void)reset;
@end
