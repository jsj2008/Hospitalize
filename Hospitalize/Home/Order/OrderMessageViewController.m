//
//  OrderMessageViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/13.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderMessageViewController.h"
#import "FCAlertAction.h"

@interface OrderMessageViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollHightConstraint;
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIView *noteView;//挂号须知view

@property (weak, nonatomic) IBOutlet UIView *applyView;//申请view

@property (weak, nonatomic) IBOutlet UIView *addmessageView;//补全信息view
//更改绑定就诊卡类型按钮
@property (weak, nonatomic) IBOutlet UIButton *applyChangeClassButton;//改变绑卡类型按钮

@end

@implementation OrderMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self closeAllView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeAllView)];
    tap.delegate =self;
    [self.blackView addGestureRecognizer:tap];
    
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    self.scrollHightConstraint.constant = KmainScreenHeight-63;
}
//确认预约按钮
- (IBAction)confirmAction:(id)sender {
    self.blackView.hidden = NO;
    self.noteView.hidden = NO;
    
}
//确认提示按钮
- (IBAction)noteConfirmAction:(id)sender {
    [self closeAllView];
    self.blackView.hidden = NO;
    self.addmessageView.hidden = NO;
}
//添加信息下一步
- (IBAction)addMessageNextAction:(id)sender {
    [self closeAllView];
    self.blackView.hidden = NO;
    self.applyView.hidden = NO;
}
//申请页选择绑卡类型
- (IBAction)applyChangeClassAction:(id)sender {
    NSString *cardString = nil;
    if ([self.applyChangeClassButton.titleLabel.text isEqualToString:@"就诊卡号"]) {
        cardString = @"病例号";
    }else if ([self.applyChangeClassButton.titleLabel.text isEqualToString:@"病例号"]){
        cardString = @"就诊卡号";
    }
   [FCAlertAction showActionSheetWithTitle:nil message:@"请选择就诊卡类型" cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitle:@[cardString] chooseBlock:^(NSInteger buttonIdx) {
       if (buttonIdx ==1) {
           [self.applyChangeClassButton setTitle:cardString forState:UIControlStateNormal];
       }
    }];
}
//关闭添加信息按钮
- (IBAction)addMessageAction:(id)sender {
    [self closeAllView];
    
}
//关闭申请view
- (IBAction)applyCloseAction:(id)sender {
    [self closeAllView];
}
//关闭所有显示的view
-(void)closeAllView{
    //关闭键盘
    [self.view endEditing:YES];  
    self.blackView.hidden = YES;
    self.noteView.hidden = YES;
    self.applyView.hidden = YES;
    self.addmessageView.hidden = YES;

}

//子视图手势不响应父视图手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.applyView]||[touch.view isDescendantOfView:self.noteView]||[touch.view isDescendantOfView:self.addmessageView]) {
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
