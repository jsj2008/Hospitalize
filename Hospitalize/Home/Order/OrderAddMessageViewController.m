//
//  OrderAddMessageViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderAddMessageViewController.h"

@interface OrderAddMessageViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *addMessageView;

@end

@implementation OrderAddMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeViewAction:)];
    tap.delegate =self;
    [self.view addGestureRecognizer:tap];
}
- (IBAction)closeViewAction:(id)sender {
    [self.view removeFromSuperview];
}
//子视图手势不响应父视图手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.addMessageView]) {
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
