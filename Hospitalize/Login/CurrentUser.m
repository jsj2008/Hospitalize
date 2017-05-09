//
//  CurrentUser.m
//  Anymed
//
//  Created by neu on 15/3/23.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "CurrentUser.h"

static CurrentUser *sharedUser = nil;
@implementation CurrentUser

@synthesize patientId = _patientId;

+ (CurrentUser *)sharedUser
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedUser = [[CurrentUser alloc] init];
        sharedUser.selectedCityName = @"";
        sharedUser.selectedCityCode = @"";
        sharedUser.locationCityName = @"";
        sharedUser.locationCityCode = @"";
        sharedUser.longitude        = @"";
        sharedUser.latitude         = @"";
        sharedUser.gender           = -1;
        sharedUser.userId           = @"";
        sharedUser.phoneNo          = @"";
        sharedUser.patientId        = @"";
        sharedUser.didSignIn        = NO;
        sharedUser.headerImageUrl   = @"";
        sharedUser.currentPatientId = @"";
    });
    
    return sharedUser;
}


- (void)reset
{
    sharedUser.userId       = @"";
    sharedUser.phoneNo      = @"";
    sharedUser.token        = @"";
    sharedUser.signingKey   = @"";
    sharedUser.patientId    = @"";
    sharedUser.gender       = -1;
    sharedUser.name         = @"";
    sharedUser.didSignIn    = NO;
    sharedUser.headerImageUrl   = @"";
    sharedUser.currentPatientId = @"";
    
}

- (void)tagsAliasCallback:(int)iResCode
                     tags:(NSSet *)tags
                    alias:(NSString *)alias {
    
    
}

- (NSString *)patientId {
    
    if (_patientId == nil || [_patientId isEqualToString:@""]) {
    
        NSUserDefaults *userDefaulet = [NSUserDefaults standardUserDefaults];
        NSString *savedPatientId = [userDefaulet objectForKey:@"saved_patientId"];
        
        if (savedPatientId.length > 0) {
            return savedPatientId;
        } else {
            return _patientId;
        }
    } else {
        return _patientId;
    }
}

@end
