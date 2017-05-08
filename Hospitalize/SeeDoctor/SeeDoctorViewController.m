//
//  SeeDoctorViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "SeeDoctorViewController.h"
#import "HospitalPrepayMoneyViewController.h"


@interface SeeDoctorViewController ()

@end

@implementation SeeDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)action:(id)sender {
    HospitalPrepayMoneyViewController *prepay = [ViewControllerUtil getViewControllerFromHospitalStoryboardWithIdentifier:@"HospitalPrepayMoneyViewController"];
    [self.navigationController pushViewController:prepay animated:YES];
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
