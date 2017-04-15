//
//  HospitalProfileViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "HospitalProfileViewController.h"
#import "DoctorCollectionViewCell.h"
#import "FCAlertAction.h"

@interface HospitalProfileViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *doctorCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *profileHeightConstraint;//医院简介模块高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *guideHeightConstraint;//就医指南模块高度
@property (weak, nonatomic) IBOutlet UILabel *profileLabel;//医院简介lable
@property (weak, nonatomic) IBOutlet UILabel *guideLabel;//就医指南lable
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *totalHeightConstraint;//总模块高度


@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;//电话lable

@end

@implementation HospitalProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.doctorCollectionView.delegate = self;
    self.doctorCollectionView.dataSource = self;
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
   CGSize profileLabelSize = [FCCommonUtil sizeWithString:self.profileLabel.text font:[UIFont systemFontOfSize:14.0] ContentMaxSize:CGSizeMake(KmainScreenWidth-15*2, 2000)];
    self.profileHeightConstraint.constant = profileLabelSize.height+65;
    CGSize guideLabelSize = [FCCommonUtil sizeWithString:self.guideLabel.text font:[UIFont systemFontOfSize:14.0] ContentMaxSize:CGSizeMake(KmainScreenWidth-15*2, 2000)];
    self.guideHeightConstraint.constant = guideLabelSize.height+65;
    
    self.totalHeightConstraint.constant = 185 + 40 + self.profileHeightConstraint.constant +self.guideHeightConstraint.constant +64;//64tabbar高度
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DoctorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DoctorCollectionViewCell" forIndexPath:indexPath];
    return cell;
}
//位置
- (IBAction)loactionAction:(id)sender {
}
//拨打电话
- (IBAction)phoneAction:(id)sender {
    NSArray *array = @[self.phoneLabel.text];
    [FCAlertAction showActionSheetWithTitle:nil message:@"拨打医院电话"  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:array chooseBlock:^(NSInteger buttonIdx) {
        if (buttonIdx > 0) {
            NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",array[buttonIdx - 1]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    }];
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
