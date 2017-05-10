//
//  HealthRecordsViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HealthRecordsViewController.h"
#import "HealthRecordsTableViewCell.h"
#import "FCAlertAction.h"

@interface HealthRecordsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation HealthRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"健康档案";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveHealthInformationAction:)];
    
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    
}





-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        return 60;
    }
    return 50;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HealthRecordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthRecordsTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.rightContent.hidden = YES;
    cell.rightImageView.hidden = YES;
    cell.line.hidden = YES;
    cell.contentTextField.enabled = YES;

    if (indexPath.row == 0) {
        cell.contentTextField.enabled = NO;
        cell.titleName.text = @"性别";
        cell.contentTextField.text = @"女";
    } else if (indexPath.row == 1){
        cell.line.hidden = NO;
        cell.contentTextField.enabled = NO;
        cell.titleName.text = @"年龄";
        cell.contentTextField.text = @"24岁";
    } else if (indexPath.row == 2){
        cell.titleName.text = @"身高(cm)";
    } else if (indexPath.row == 3){
        cell.titleName.text = @"体重(kg)";
    } else if (indexPath.row == 4){
        cell.rightImageView.hidden = NO;
        cell.rightContent.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else if (indexPath.row == 5){
        cell.titleName.text = @"过敏史";
    } else if (indexPath.row == 6){
        cell.titleName.text = @"重大病史";
    } else if (indexPath.row == 7){
        cell.titleName.text = @"家庭病史";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 4) {
        NSArray *array = @[@"未知血型",@"A血型",@"B血型",@"O血型",@"AB血型",@"其他血型"];
        [FCAlertAction showActionSheetWithTitle:nil message:nil  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:array chooseBlock:^(NSInteger buttonIdx) {
            if (buttonIdx > 0) {
                NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"%@",array[buttonIdx - 1]];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
            }
        }];
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

//保存信息
-(void)saveHealthInformationAction:(id)sender{
    
}

@end
