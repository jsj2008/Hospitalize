//
//  AboutViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//  关于

#import "AboutViewController.h"
#import "ReleaseNotesViewController.h"

@interface AboutViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *name;


@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"关于";
}

//打开版本说明
- (IBAction)openReleaseNotesAction:(id)sender {
    ReleaseNotesViewController *releaseNotes = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"ReleaseNotesViewController"];
    [self.navigationController pushViewController:releaseNotes animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
