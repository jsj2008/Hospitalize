//
//  CasesViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "CasesViewController.h"
#import "CasesListViewController.h"

@interface CasesViewController ()

@end

@implementation CasesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonAction:(id)sender {
    CasesListViewController *lsit = [ViewControllerUtil getViewControllerFromCasesStoryboardWithIdentifier:@"CasesListViewController"];
    [self.navigationController pushViewController:lsit animated:YES];
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
