//
//  NXLoginManager.m
//  Anymed
//
//  Created by sunyw on 15/6/9.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "NXLoginManager.h"
#import "NXLogin.h"
#import "JPUSHService.h"
#import "NXLoginClient.h"
#import "CurrentUser.h"

static NXLoginManager *sharedNXLoginManager = nil;

@implementation NXLoginManager

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutNotification:) name:LOGOUT_NXLogoutNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+(instancetype)alloc {
    @synchronized(self) {
        if (sharedNXLoginManager == nil) {
            sharedNXLoginManager = [super alloc];
            return sharedNXLoginManager;
        }
    }
    return sharedNXLoginManager;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    @synchronized(self) {
        if (sharedNXLoginManager == nil) {
            sharedNXLoginManager = [super allocWithZone:zone];
            return sharedNXLoginManager;
        }
    }
    return nil;
}

+ (id)copyWithZone:(NSZone *)zone {
    return self;
}

+ (instancetype)sharedNXLoginManager
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedNXLoginManager = [[NXLoginManager alloc] init];
    });
    
    return sharedNXLoginManager;
}


- (void) doLogin:(AMMGesUserInfo *)inputModel {
    @weakify(self);
    [NXLogin doLogin:inputModel success:^(AMMGesUserInfo *model) {
        @strongify(self);
        if(model == nil) {
            [[CurrentUser sharedUser] reset];
            return ;
        }
        [CurrentUser sharedUser].userId     = model.userId;
        [CurrentUser sharedUser].phoneNo    = model.phoneNo;
        [CurrentUser sharedUser].patientId  = model.patientId;
        [CurrentUser sharedUser].currentPatientId  = model.patientId;
        [CurrentUser sharedUser].didSignIn  = YES;
        [CurrentUser sharedUser].token      = model.token;
        [CurrentUser sharedUser].signingKey = model.signingKey;
        [CurrentUser sharedUser].gender     = model.gender;
        [CurrentUser sharedUser].name       = model.name;
        [CurrentUser sharedUser].headerImageUrl    = model.patientHead;
        [CurrentUser sharedUser].merchantNo = model.merchantNo;
        
        [NMLogin sharedLogin].didSignIn = YES;
        [NMLogin sharedLogin].token = model.token;
        [NMLogin sharedLogin].signingKey = model.signingKey;
        [NMLogin sharedLogin].userId = model.userId;
        [NMLogin sharedLogin].merchantNo = model.merchantNo;
        [NMLogin sharedLogin].name = model.name;
        [NMLogin sharedLogin].phoneNo = model.phoneNo;
        [NMLogin sharedLogin].patientHead = model.patientHead;
        [NMLogin sharedLogin].gender = model.gender;
        
        [AMDBHelper replaceUserInfo:model];
        
        NSString *phoneMd5Str = [model.phoneNo md5HexDigest];
        [JPUSHService setTags:nil alias:phoneMd5Str callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:self];
        
        [AMAUserCenterAPI registerImWithSuccess:^(NXTFRegisterImResp *imAccountResp) {
            
            [CurrentUser sharedUser].tImid = imAccountResp.tImId;
            [CurrentUser sharedUser].tImToken = imAccountResp.tImToken;
            
            [self loginQCloud:YES];
            
        } failure:^(NSError *error) {
            
        }];
        

    } failure:^{
        @strongify(self);
        [[CurrentUser sharedUser] reset];

        [JPUSHService setTags:nil alias:@"" callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:self];
    }];
}

- (void)tagsAliasCallback:(int)iResCode
                     tags:(NSSet *)tags
                    alias:(NSString *)alias {

    
}

- (void)logoutNotification:(NSNotification*)notify {
    
    [[CurrentUser sharedUser] reset];
    [NMLogin sharedLogin].didSignIn = NO;
    [NMLogin sharedLogin].token = @"";
    [NMLogin sharedLogin].signingKey = @"";
    [NMLogin sharedLogin].userId = @"";
    [NMLogin sharedLogin].gender = -1;
    [NMLogin sharedLogin].patientHead = @"";
    [NMLogin sharedLogin].phoneNo = @"";
    [NMLogin sharedLogin].name = @"";
    
    [NXLogin doLogout:^(AMMGesUserInfo *model) {
        [[NXLoginClient shareClient] QIMlogout];
        
    }];
    [JPUSHService setTags:nil alias:@"" callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:self];
    
    if(notify) {
        
        NSDictionary *dic =  [NSDictionary dictionaryWithObject:@"needBack" forKey:@"forceShow"];
        [[NSNotificationCenter defaultCenter]postNotificationName:LOGIN_ShowLoginViewController object:self userInfo:dic];
    }

}

#pragma mark - 腾讯云登陆

/**
 *  腾讯云关联账号登陆
 *
 *  @param checkTwice 设置为YES时，登陆失败时会尝试二次连接
 */
- (void)loginQCloud:(BOOL)checkTwice
{
    @weakify(self);
    [[NXLoginClient shareClient] login:[CurrentUser sharedUser].tImid
                               userSig:[CurrentUser sharedUser].tImToken
                               success:^{
                                   [self setTIMNickName];
                                   [[NSNotificationCenter defaultCenter] postNotificationName:NXTENCENT_LOGIN object:@"Success"];
                               } failure:^(int code, NSString *err) {
                                   [[NSNotificationCenter defaultCenter] postNotificationName:NXTENCENT_LOGIN object:@"Fail"];
                                   @strongify(self);
                                   if (checkTwice) {
                                       [self loginQCloud:NO];
                                   }
                               }];
}
// 同步腾讯昵称
- (void)setTIMNickName{
    // 判断我得昵称是否存在
    [[TIMFriendshipManager sharedInstance]GetSelfProfile:^(TIMUserProfile *profile) {
        if (profile.nickname.length > 0 && profile.nickname.length < 10) {
            // 正常的昵称
        }else{
            // 获取用户名
            NSString *randomNickName;
            if ([CurrentUser sharedUser].name.length > 0 && [CurrentUser sharedUser].name.length < 10) {
                randomNickName = [CurrentUser sharedUser].name;
            }else{
                // 非法昵称需要重新随机赋值
                NSString *randomName = [NSString stringWithFormat:@"%@%d",@"ChangeNickNameRandom",arc4random()%167];
                randomNickName = NSLocalizedString(randomName, @"");
            }
            // 大象服务器更新成功，调用腾讯接口修改昵称
            [[TIMFriendshipManager sharedInstance]SetNickname:randomNickName succ:^{
                // 腾讯成功
            } fail:^(int code, NSString *msg) {
                // 腾讯失败
            }];
        }
    } fail:^(int code, NSString *msg) {
    }];
}


@end
