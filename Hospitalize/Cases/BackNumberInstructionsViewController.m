//
//  BackNumberInstructionsViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//  就诊退号说明

#import "BackNumberInstructionsViewController.h"
#import "ElectronicMedicalRecordsViewController.h"

@interface BackNumberInstructionsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *medicalGuide;

@end

@implementation BackNumberInstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"就诊退号说明";
    [self.medicalGuide addTarget:self action:@selector(checkMedicalGuideAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)checkMedicalGuideAction:(id)sender{
    ElectronicMedicalRecordsViewController *electronicMedicalRecords = [ViewControllerUtil getViewControllerFromCasesStoryboardWithIdentifier:@"ElectronicMedicalRecordsViewController"];
    [self.navigationController pushViewController:electronicMedicalRecords animated:YES];
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
