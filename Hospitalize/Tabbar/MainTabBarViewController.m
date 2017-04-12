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
#import "FourthViewController.h"
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
    [self setChildVC:thridVC title:@"" image:@"" selectedImage:@""];
    
    FourthViewController *fourthVC = [[FourthViewController alloc] init];
    [self setChildVC:fourthVC title:@"病例" image:@"person" selectedImage:@"mine"];
    
    FifthViewController *fifthVC = [[FifthViewController alloc] init];
    [self setChildVC:fifthVC title:@"个人" image:@"person" selectedImage:@"mine"];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [addBtn setBackgroundImage:[[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    float height = self.tabBar.frame.size.height;
    //添加大按钮
    addBtn.frame = CGRectMake(self.tabBar.width*0.5-(height*0.5), 0-height*0.1, height*1, height*1);
    [self.tabBar addSubview:addBtn];
    UIImageView *iv= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine"]];
    //添加大按钮外面的白圈
    iv.frame = CGRectMake(self.tabBar.width*0.5-(height*0.6), 0-height*0.2, height*1.2, height*1.2);
    [self.tabBar addSubview:iv];
    [self.tabBar addSubview:addBtn];
    
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
