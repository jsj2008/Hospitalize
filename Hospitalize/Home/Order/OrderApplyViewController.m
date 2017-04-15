//
//  OrderApplyViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderApplyViewController.h"
#import "FCAlertAction.h"

@interface OrderApplyViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *applyView;
@property (weak, nonatomic) IBOutlet UIButton *changeClassButton;

@end

@implementation OrderApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeAction:)];
    tap.delegate =self;
    [self.view addGestureRecognizer:tap];

}
//更换绑卡类型
- (IBAction)changeClassAction:(id)sender {
    NSString *cardString = nil;
    if ([self.changeClassButton.titleLabel.text isEqualToString:@"就诊卡号"]) {
        cardString = @"病例号";
    }else if ([self.changeClassButton.titleLabel.text isEqualToString:@"病例号"]){
        cardString = @"就诊卡号";
    }
    [FCAlertAction showActionSheetWithTitle:nil message:@"请选择就诊卡类型" cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:@[cardString] chooseBlock:^(NSInteger buttonIdx) {
        if (buttonIdx ==1) {
            [self.changeClassButton setTitle:cardString forState:UIControlStateNormal];
        }
    }];

}

- (IBAction)closeAction:(id)sender {
    [self.view removeFromSuperview];
}

//子视图手势不响应父视图手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.applyView]) {
        return NO;
    }
    return YES;
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
