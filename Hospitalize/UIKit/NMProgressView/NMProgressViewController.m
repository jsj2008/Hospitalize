//
//  NMProgressViewController.m
//  progressView
//
//  Created by sunyw on 4/1/15.
//  Copyright (c) 2015 sunyw. All rights reserved.
//

#import "NMProgressViewController.h"
#import "NMProgressCircleView.h"

static NSMutableArray *retainQueue;
static NSMutableArray *displayQueue;
static NSMutableArray *dismissQueue;

static NMProgressViewController *currentNXPViewController;

@interface NMProgressViewController ()

@property (nonatomic,strong) NMProgressCircleView * nxProgressCircleView;
@property (nonatomic,strong) UIWindow *nxProgressWindow;

@end

@implementation NMProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

+(NMProgressViewController*)progressViewWithBody:(NSString*)bodyText type:(NMProgressViewType)progressType hidesAfter:(float)delay show:(BOOL)show {
    
    NMProgressViewController *nXPViewController = [[NMProgressViewController alloc] init];
    nXPViewController.bodyText          = bodyText;
    nXPViewController.progressType      = progressType;
    nXPViewController.viewHideDelay     = delay;
    nXPViewController.backgroundColor   = [UIColor colorWithWhite:0.9 alpha:0.8];
    [nXPViewController initView];
    
    if(show) {
        [nXPViewController addToDisplayQueue];
    }
    if(delay > 0) {
        nXPViewController.hideTimer = [NSTimer scheduledTimerWithTimeInterval:delay target:nXPViewController selector:@selector(dismissController) userInfo:nil repeats:NO];
    }
    else {
        nXPViewController.hideTimer = [NSTimer scheduledTimerWithTimeInterval:30 target:nXPViewController selector:@selector(dismissController) userInfo:nil repeats:NO];
    }
    
    
    return nXPViewController;
}

+(NMProgressViewController*)progressViewWithBody:(NSString*)bodyText type:(NMProgressViewType)progressType show:(BOOL)show {
    
    NMProgressViewController *nXPViewController = [[NMProgressViewController alloc] init];
    nXPViewController.bodyText          = bodyText;
    nXPViewController.progressType      = progressType;
    nXPViewController.backgroundColor   = [UIColor colorWithWhite:0.9 alpha:0.8];
    [nXPViewController initView];
    
    if(show) {
        [nXPViewController addToDisplayQueue];
    }
    
    return nXPViewController;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(continueAnimating) name: @"APPDELEGATE_NXPViewDidAppearNotification" object:nil];
    }
    return self;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if (_nxProgressWindow) {
        _nxProgressWindow.hidden = YES;
        [_nxProgressWindow resignKeyWindow];
    }
    
}

- (void) continueAnimating {
    
    if (currentNXPViewController && currentNXPViewController.isAnimating) {
        [currentNXPViewController.nxProgressCircleView setIsAnimating:YES];
    }
    
}

- (void) initView {
    
    CGFloat backViewWidth = self.view.frame.size.width/3.0;
    if (backViewWidth<120.0) {
        backViewWidth = 120.0;
    }
    self.view.backgroundColor = [UIColor clearColor];
    self.backProgressView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-backViewWidth)/2.0, (self.view.frame.size.height-backViewWidth)/2.0, backViewWidth, backViewWidth)];
    self.backProgressView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8] ;
    self.backProgressView.layer.masksToBounds = YES;
    self.backProgressView.layer.cornerRadius = 10.0;
    [self.view addSubview:self.backProgressView];
    
    self.nxProgressCircleView = [NMProgressCircleView circleWithColor:[UIColor colorWithRed:50.0/255.0 green:155.0/255.0 blue:255.0/255.0 alpha:0.8] width:backViewWidth/2.0];
    CGRect circleRect = CGRectMake((self.backProgressView.frame.size.width-backViewWidth/2.0)/2.0, (self.backProgressView.frame.size.height-backViewWidth/2.0)/2.0, backViewWidth/2.0, backViewWidth/2.0);
    circleRect.origin = CGPointMake(self.backProgressView.bounds.size.width/2.0 - circleRect.size.width/2.0, 10);
    self.nxProgressCircleView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.nxProgressCircleView.frame = circleRect;
    self.nxProgressCircleView.hasGlow = YES;
    self.nxProgressCircleView.isAnimating = YES;
    self.nxProgressCircleView.speed = 0.55;
    [self.backProgressView addSubview:self.nxProgressCircleView];
    
    self.bodyLabel = [[UILabel alloc] init];
    if (backViewWidth == 120.0) {
        self.bodyLabel.font = [UIFont systemFontOfSize:12.0];
    } else {
        self.bodyLabel.font = [UIFont systemFontOfSize:14.0];
    }
    
    self.bodyLabel.textColor = [UIColor whiteColor];
    self.bodyLabel.textAlignment = NSTextAlignmentCenter;
    self.bodyLabel.frame = CGRectMake(0, backViewWidth/2.0, backViewWidth, backViewWidth/2.0);
    if (self.bodyText.length >0) {
        self.bodyLabel.text = self.bodyText;
    } else {
        self.bodyLabel.text = NSLocalizedString(@"LoadingPleaseWait", @"");
        
    }
    [self.backProgressView addSubview:self.bodyLabel];
    
    

}

- (UIWindow*)nxProgressWindow {
    
    if (_nxProgressWindow == nil) {
        _nxProgressWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _nxProgressWindow.windowLevel = UIWindowLevelStatusBar+1;
        _nxProgressWindow.hidden = NO;
        _nxProgressWindow.alpha = 1.0;
        _nxProgressWindow.userInteractionEnabled = YES;
        [_nxProgressWindow makeKeyAndVisible];
    }
    return _nxProgressWindow;
}

- (void)addToDisplayQueue
{
    if(!displayQueue)
        displayQueue = [NSMutableArray arrayWithCapacity:2];
    if(!dismissQueue)
        dismissQueue = [NSMutableArray arrayWithCapacity:2];
    
    [displayQueue addObject:self];
    [dismissQueue addObject:self];
    
    if(retainQueue.count == 0)
    {
        currentNXPViewController = self;
        currentNXPViewController.isAnimating = YES;
        [self addToWindow];
    }

}
                        
- (void)addToWindow {
    
    if (self.nxProgressWindow) {
        
        [self.nxProgressWindow addSubview:self.view];
        [self.nxProgressWindow makeKeyAndVisible];
    }
    
    [self resignFirstRespondersForSubviews:_nxProgressWindow];

}

- (void)dismissController
{
    if(dismissQueue.count > 0)
    {
        NMProgressViewController *lastViewController = [dismissQueue lastObject];
        [displayQueue removeObject:lastViewController];
        [dismissQueue removeObject:lastViewController];
        [lastViewController dismiss];
        
    }
}

+ (void)dismissCurrentViewController
{
    if(dismissQueue.count > 0)
    {
        NMProgressViewController *lastViewController = [dismissQueue lastObject];
        [displayQueue removeObject:lastViewController];
        [dismissQueue removeObject:lastViewController];
        [lastViewController dismiss];

    }
}

+ (void)dismissCurrentAfterDelay:(float)delay
{
    [[NMProgressViewController class] performSelector:@selector(dismissCurrentViewController) withObject:nil afterDelay:delay];
}

-(void)dismiss
{
    if(!retainQueue)
        retainQueue = [[NSMutableArray alloc] init];
    
    [self.hideTimer invalidate];
    [retainQueue addObject:self];

    [self addDismissAnimation];
    
}

//把编辑窗口都关掉
-(void)resignFirstRespondersForSubviews:(UIView *)view
{
    [self resignFirstRespondersForView:view];
}


-(void)resignFirstRespondersForView:(UIView*)view
{
    for (UIView *subview in [view subviews])
    {
        if ([subview isKindOfClass:[UITextField class]] || [subview isKindOfClass:[UITextView class]]) {
            [(id)subview resignFirstResponder];
        }
        [self resignFirstRespondersForView:subview];
    }
}


#define kDismissDuration 0.1

-(void)addDismissAnimation
{
    NSArray *frameTimes = @[@(0.15), @(0.05)];
    CAKeyframeAnimation *animation = [self animationWithValues:nil times:frameTimes duration:kDismissDuration];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.view.layer addAnimation:animation forKey:@"popup"];

    [self performSelector:@selector(removeFromView) withObject:nil afterDelay:0.1];
}

-(CAKeyframeAnimation*)animationWithValues:(NSArray*)values times:(NSArray*)times duration:(CGFloat)duration
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.removedOnCompletion = NO;
    animation.duration = duration;
    return animation;
}

-(void)removeFromView
{
    if (retainQueue.count >0) {
        [retainQueue removeObject:self];
    }
    
    currentNXPViewController.isAnimating = YES;
    [currentNXPViewController.view removeFromSuperview];
    currentNXPViewController = nil;
    
    if(displayQueue.count > 0)
    {
        NMProgressViewController *viewController = [displayQueue objectAtIndex:0];
        currentNXPViewController = viewController;
        [viewController addToWindow];
    }
}

@end
