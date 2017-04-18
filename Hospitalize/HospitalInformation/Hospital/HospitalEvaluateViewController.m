//
//  HospitalEvaluateViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalEvaluateViewController.h"
#import "FCStarView.h"

@interface HospitalEvaluateViewController ()

@property (weak, nonatomic) IBOutlet UIView *starBaseView;
@property (strong, nonatomic) FCStarView *starView;


@end

@implementation HospitalEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"医院评价";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction:)];
    
    
    self.starView = [[FCStarView alloc]initWithFrame:CGRectMake(0, 0, 200, 35) withNumberOfStars:5 withPercent:1 withUserInteractionEnabled:YES];
    [self.starBaseView addSubview:self.starView];
    
}

#pragma mark Action
- (void)rightBarButtonAction:(id)sender {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
