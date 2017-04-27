//
//  ChiefComplaintViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/26.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "ChiefComplaintViewController.h"

@interface ChiefComplaintViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *consultant;
@property (weak, nonatomic) IBOutlet UILabel *person;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *healthCard;
@property (weak, nonatomic) IBOutlet UILabel *healthCardContent;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@property (weak, nonatomic) IBOutlet UILabel *nameDisease;
@property (weak, nonatomic) IBOutlet UILabel *prompt;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UILabel *contentPrompt;

@end

@implementation ChiefComplaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"反馈";
    self.content.delegate = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitAction:)];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (![text isEqualToString:@""]) {
        self.contentPrompt.hidden = YES;
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        self.contentPrompt.hidden = NO;
    }
    
    return YES;
}

//提交事件
- (void)submitAction:(id)sender {
    
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
