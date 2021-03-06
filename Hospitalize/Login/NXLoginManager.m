//
//  NXLoginManager.m
//  Anymed
//
//  Created by sunyw on 15/6/9.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "NXLoginManager.h"
#import "CurrentUser.h"
#import "FCMacros.h"

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
    [NXLogin doLogin:inputModel success:^(AMMGesUserInfo *model) {
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
    
        [AMAUserCenterAPI registerImWithSuccess:^(NXTFRegisterImResp *imAccountResp) {
            
            [CurrentUser sharedUser].tImid = imAccountResp.tImId;
            [CurrentUser sharedUser].tImToken = imAccountResp.tImToken;
        } failure:^(NSError *error) {
            
        }];
        
    } failure:^{
        [[CurrentUser sharedUser] reset];
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
//        [[NXLoginClient shareClient] QIMlogout];
        
    }];

    
    if(notify) {
        NSDictionary *dic =  [NSDictionary dictionaryWithObject:@"needBack" forKey:@"forceShow"];
        [[NSNotificationCenter defaultCenter]postNotificationName:LOGIN_ShowLoginViewController object:self userInfo:dic];
    }

}


@end
