//
//  FCAlertLabel.m
//  AlertLabelDemo
//
//  Created by 周鑫 on 15/6/3.
//  Copyright (c) 2015年 HZTeam. All rights reserved.
//

#import "FCAlertLabel.h"

#define NXAlertLabelFont        15.0
#define NXAlertLabelWidthSpace  40.0
#define NXAlertLabelHeightSpace 20.0
#define NXAlertLabelMinShowTime 2.0
#define NXAlertLabelReadSpeed   20.0
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface FCAlertLabel ()

@property (strong, nonatomic) UIView  *backView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIWindow *nxAlertLabelWindow;
@end

@implementation FCAlertLabel

static FCAlertLabel *alertLabel = nil;

+ (instancetype)sharedAlertLabel {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        alertLabel                                 = [[FCAlertLabel alloc]init];

        alertLabel.backView                        = [[UIView alloc]init];
        alertLabel.backView.backgroundColor        = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        alertLabel.backView.layer.cornerRadius     = 5.0;
        alertLabel.backView.clipsToBounds          = YES;
        alertLabel.backView.hidden                 = YES;
        alertLabel.backView.userInteractionEnabled = NO;

        alertLabel.label                           = [[UILabel alloc]init];
        alertLabel.label.backgroundColor           = [UIColor clearColor];
        alertLabel.label.textColor                 = [UIColor whiteColor];
        alertLabel.label.textAlignment             = NSTextAlignmentCenter;
        alertLabel.label.font                      = [UIFont systemFontOfSize:NXAlertLabelFont];
        alertLabel.label.numberOfLines             = 0;
        alertLabel.label.lineBreakMode             = NSLineBreakByCharWrapping;
        alertLabel.label.userInteractionEnabled    = NO;
        
        [alertLabel.backView addSubview:alertLabel.label];
        
        if (alertLabel.nxAlertLabelWindow == nil) {
            alertLabel.nxAlertLabelWindow = [[UIWindow alloc] init];
            alertLabel.nxAlertLabelWindow.tag = kAlertLabelTag;
            alertLabel.nxAlertLabelWindow.backgroundColor = [UIColor clearColor];
            alertLabel.nxAlertLabelWindow.windowLevel = UIWindowLevelNormal;
            alertLabel.nxAlertLabelWindow.hidden = NO;
            alertLabel.nxAlertLabelWindow.alpha = 1.0;
            alertLabel.nxAlertLabelWindow.bounds = CGRectMake(0, (ScreenHeight-NXAlertLabelHeightSpace)/2, ScreenWidth, NXAlertLabelHeightSpace);
            alertLabel.nxAlertLabelWindow.center = [UIApplication sharedApplication].keyWindow.center;
            alertLabel.nxAlertLabelWindow.userInteractionEnabled = YES;
            [alertLabel.nxAlertLabelWindow makeKeyAndVisible];
            [alertLabel.nxAlertLabelWindow addSubview:alertLabel.backView];
        }
        
    });
    
    return alertLabel;
}

- (void)showAlertLabelWithAlertString:(NSString *)alertString {
    
    if (alertString.length < 1) {
        return;
    }
    
    NSTimeInterval showTime = alertString.length/NXAlertLabelReadSpeed;
    if (showTime < NXAlertLabelMinShowTime) {
        showTime = NXAlertLabelMinShowTime;
    }
    
    _label.text         = alertString;
    CGRect aStringRect  = [self getStringWidthWithString:alertString font:[UIFont systemFontOfSize:NXAlertLabelFont]];
    
    _backView.hidden    = NO;
    _backView.frame    = CGRectMake(0, 0, aStringRect.size.width + NXAlertLabelWidthSpace, aStringRect.size.height + NXAlertLabelHeightSpace);

    alertLabel.nxAlertLabelWindow.hidden = NO;
    alertLabel.nxAlertLabelWindow.bounds = _backView.bounds;
    _backView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    _label.frame = CGRectMake(NXAlertLabelWidthSpace/2, NXAlertLabelHeightSpace/2, _backView.bounds.size.width - NXAlertLabelWidthSpace, _backView.bounds.size.height - NXAlertLabelHeightSpace);
    

    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:10 initialSpringVelocity:15 options:UIViewAnimationOptionCurveLinear animations:^{
        
        _backView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
        [FCAlertLabel cancelPreviousPerformRequestsWithTarget:self];
        [self performSelector:@selector(alertLabelHidden) withObject:nil afterDelay:showTime];
    }];
}

- (void)hideAlertLabeImmediatelyIfShowing {
    
    alertLabel.nxAlertLabelWindow.hidden = YES;
}

- (void)alertLabelHidden {
    
    alertLabel.nxAlertLabelWindow.hidden = YES;
    [UIView animateWithDuration:0.1 animations:^{
        _backView.alpha = 0;
    } completion:^(BOOL finished) {
        
        _backView.hidden = YES;
        _backView.alpha  = 1;
    }];
}

- (CGRect)getStringWidthWithString:(NSString *)aString font:(UIFont *)aFont {
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:aFont forKey:NSFontAttributeName];
    
    CGSize stringSize  = CGSizeMake(ScreenWidth - (NXAlertLabelWidthSpace*2) , MAXFLOAT);
    
    CGRect aStringRect = [aString boundingRectWithSize:stringSize
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attributes
                                               context:nil];
    
    return aStringRect;
}

@end
