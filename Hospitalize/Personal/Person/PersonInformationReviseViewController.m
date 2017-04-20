//
//  PersonInformationReviseViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "PersonInformationReviseViewController.h"
#import "HealthRecordsTableViewCell.h"
#import "ModifyNicknameViewController.h"
#import "ChangePasswordViewController.h"
#import "FCAlertAction.h"

@interface PersonInformationReviseViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation PersonInformationReviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人信息";
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 75;
    } else if (indexPath.row == 1){
        return 60;
    }
    return 50;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HealthRecordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthRecordsTableViewCell" forIndexPath:indexPath];
    cell.rightContent.hidden = NO;
    cell.line.hidden = YES;
    cell.porImageView.hidden = YES;
    cell.titleName.textColor = COLOR666666;
    cell.rightContent.textColor = COLOR333333;
    if (indexPath.row == 0) {
        cell.rightContent.hidden = YES;
        cell.titleName.text = @"头像";
        cell.porImageView.hidden = NO;
    } else if (indexPath.row == 1){
        cell.line.hidden = NO;
        cell.porImageView.hidden = YES;
        cell.titleName.text = @"昵称";
        cell.rightContent.text = @"梅子屋";
    } else if (indexPath.row == 2){
        cell.titleName.text = @"手机号";
        cell.rightContent.text = @"135****0305";
    } else if (indexPath.row == 3){
        cell.titleName.text = @"修改密码";
        cell.rightContent.text = @"";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == 0) {
        NSArray *array = @[@"拍照",@"从手机相册选择"];
        [FCAlertAction showActionSheetWithTitle:nil message:nil  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:array chooseBlock:^(NSInteger buttonIdx) {
            if (buttonIdx > 0) {
                NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"%@",array[buttonIdx - 1]];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
            }
        }];
    } else if (indexPath.row == 1){
        ModifyNicknameViewController *modifyNickname = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"ModifyNicknameViewController"];
        [self.navigationController pushViewController:modifyNickname animated:YES];
    } else if (indexPath.row == 2){
        
    } else if (indexPath.row == 3){
        ChangePasswordViewController *changePassword = [ViewControllerUtil getViewControllerFromPersonalStoryboardWithIdentifier:@"ChangePasswordViewController"];
        [self.navigationController pushViewController:changePassword animated:YES];
    }
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
