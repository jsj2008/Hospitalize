//
//  DoctorViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/19.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "DoctorViewController.h"
#import "DoctorHeadTableViewCell.h"
#import "DoctorMajorTableViewCell.h"
#import "DoctorFunctionTableViewCell.h"
#import "DoctorIntroTableViewCell.h"

@interface DoctorViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation DoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 222;
    }else if (indexPath.row ==1){
        return 128;
    }else if (indexPath.row ==2){
        return 137;
    }else if (indexPath.row ==3){
        return 172;
    }else{
        return 0;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        DoctorHeadTableViewCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorHeadTableViewCell"];
        return headCell;
    }else if (indexPath.row ==1){
        DoctorMajorTableViewCell *majorCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorMajorTableViewCell"];
        return majorCell;
    }
//    else if (indexPath.row ==3){
//        DoctorFunctionTableViewCell *functionCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorFunctionTableViewCell"];
//        return functionCell;
//    }
    else if (indexPath.row ==3)
    {
        DoctorIntroTableViewCell *introCell = [tableView dequeueReusableCellWithIdentifier:@"DoctorIntroTableViewCell1"];
        return introCell;
    }
    else{
        return nil;
    }
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
