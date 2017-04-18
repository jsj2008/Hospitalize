//
//  MainTabBarViewController.m
//  Logic
//
//  Created by 宋明月 on 2017/4/7.
//  Copyright © 2017年 宋明月. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "ThridViewController.h"
#import "CasesViewController.h"
#import "FifthViewController.h"

#import "UIView+Extension.h"
#import "ViewControllerUtil.h"


@interface MainTabBarViewController ()

@property(nonatomic,strong)UIView *zheZhaoView;

@property(nonatomic,strong)NSMutableArray *btnArr;

@property(nonatomic,strong)UIButton *closeBtn;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    HomeViewController *firstVC = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"HomeViewController"];
    [self setChildVC:firstVC title:@"导诊" image:@"person" selectedImage:@"mine"];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self setChildVC:secondVC title:@"就诊" image:@"person" selectedImage:@"mine"];
    
    ThridViewController *thridVC = [[ThridViewController alloc] init];
    [self setChildVC:thridVC title:@"消息" image:@"person" selectedImage:@"mine"];
    
    CasesViewController *casesVC = [ViewControllerUtil getViewControllerFromCasesStoryboardWithIdentifier:@"CasesViewController"];
    [self setChildVC:casesVC title:@"病例" image:@"person" selectedImage:@"mine"];
    
    FifthViewController *fifthVC = [[FifthViewController alloc] init];
    [self setChildVC:fifthVC title:@"个人" image:@"person" selectedImage:@"mine"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setChildVC:(UIViewController *)childVC title:(NSString *) title image:(NSString *) image selectedImage:(NSString *) selectedImage {
    
    childVC.tabBarItem.title = title;
    childVC.navigationItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    [self addChildViewController:childVC];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}


@end
