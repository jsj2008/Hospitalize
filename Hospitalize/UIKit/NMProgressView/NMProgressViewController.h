//
//  NMProgressViewController.h
//  progressView
//
//  Created by sunyw on 4/1/15.
//  Copyright (c) 2015 sunyw. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum {
    NMProgressViewTypeDefault,

} NMProgressViewType;


@interface NMProgressViewController : UIViewController {
    BOOL isPendingDismissal;
    
}
@property (nonatomic, copy) id dismissalBlock;

@property (nonatomic,copy) NSString *bodyText;
@property (nonatomic, assign) NMProgressViewType progressType;
@property (nonatomic, assign) float viewHideDelay;
@property (nonatomic, assign) BOOL addsToWindow;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIView *backProgressView;
@property (nonatomic, strong) UILabel *bodyLabel;

@property (nonatomic, strong) NSTimer *hideTimer;
@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) BOOL hasGlow;
@property (nonatomic, assign) float speed;

//默认30秒，等待状态自动消失
+(NMProgressViewController*)progressViewWithBody:(NSString*)bodyText type:(NMProgressViewType)progressType hidesAfter:(float)delay show:(BOOL)show;

//等待状态不会自动消失
+(NMProgressViewController*)progressViewWithBody:(NSString*)bodyText type:(NMProgressViewType)progressType show:(BOOL)show;

+(void)dismissCurrentAfterDelay:(float)delay;
+(void)dismissCurrentViewController;

-(void)dismiss;

@end


