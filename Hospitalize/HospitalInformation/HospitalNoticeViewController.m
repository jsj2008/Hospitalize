//
//  HospitalNoticeViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalNoticeViewController.h"
#import "HospitalNoticeTimeTableViewCell.h"
#import "HospitalNoticeMessageTableViewCell.h"


@interface HospitalNoticeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation HospitalNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"医院公告";
    
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];

    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        return 56;
    } else if (indexPath.row % 2 == 1){
        return 200;
    }
    return 0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        HospitalNoticeTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalNoticeTimeTableViewCell" forIndexPath:indexPath];
        cell.timeLabel.layer.masksToBounds = YES;
        return cell;
    } else if (indexPath.row % 2 == 1){
        HospitalNoticeMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalNoticeMessageTableViewCell" forIndexPath:indexPath];
        cell.hospitalNoticeMessageView.layer.masksToBounds = YES;
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}


@end
