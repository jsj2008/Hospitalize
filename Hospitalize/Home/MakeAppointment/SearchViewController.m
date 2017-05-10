//
//  SearchViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/13.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "SearchViewController.h"
#import "UIView+Extension.h"
#import "HomeHospitalizeTableViewCell.h"
#import "SearchHistoryTableViewCell.h"
#import "SearchEmptyHistoryTableViewCell.h"

@interface SearchViewController ()<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *titleView;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *notResultsView;
@property (weak, nonatomic) IBOutlet UITableView *historyTableView;

// 搜索历史
@property (strong, nonatomic)NSMutableArray *searchHistoryArray;
// 医院数组
@property (strong, nonatomic)NSMutableArray *hospArray;


@end

@implementation SearchViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.alpha = 0;
    [self.searchTextField becomeFirstResponder];
    self.titleView.backgroundColor = COLOR4B89DC;
    // 取得保存的搜索历史记录
    [self savedSearchHistoryArray];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.alpha = 1;
    [self.searchTextField resignFirstResponder];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 搜索框左的提示图标
    UIImageView *leftView = [[UIImageView alloc]init];
    leftView.image = [UIImage imageNamed:@"home_icon_search"];
    leftView.size = CGSizeMake(leftView.image.size.width + 10, leftView.image.size.height);
    leftView.contentMode = UIViewContentModeCenter;
    self.searchTextField.leftView = leftView;
    self.searchTextField.leftViewMode = UITextFieldViewModeAlways;
    self.searchTextField.delegate = self;
    
    
    [self.backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchButton addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self setExtraCellLineHidden:self.mainTableView];
    self.notResultsView.hidden = YES;
    self.mainTableView.hidden = YES;
    
    
    self.historyTableView.delegate = self;
    self.historyTableView.dataSource = self;
    [self setExtraCellLineHidden:self.historyTableView];
}


-(void)goBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchAction:(id)sender{
    NSString *keyWord = self.searchTextField.text;
    [self saveSearchHistoryAction:keyWord];
    [self.searchTextField resignFirstResponder];
}

#pragma mark - TableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) {
        return [self.hospArray count];
    } else {
        if ([self.searchHistoryArray count] > 0) {
            return [self.searchHistoryArray count] + 1;
        }
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mainTableView) {
        HomeHospitalizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeHospitalizeTableViewCell"];
        return cell;
    } else {
        if (indexPath.row == [self.searchHistoryArray count]) {
            SearchEmptyHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchEmptyHistoryTableViewCell"];
            [cell.emptyHistoryButton addTarget:self action:@selector(clearSearchHistoryAction:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        } else {
            SearchHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHistoryTableViewCell"];
            cell.historyLabel.text = [self.searchHistoryArray objectAtIndex:indexPath.row];
            return cell;
        }
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.mainTableView) {
        
    } else {
        NSString *keyWord = @"";
        
        if (self.searchHistoryArray.count > 0) {
            keyWord = [self.searchHistoryArray objectAtIndex:indexPath.row];
        }
        self.historyTableView.hidden = YES;
        self.mainTableView.hidden = NO;
    }
}

-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UISearchBarDelegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.historyTableView.hidden = NO;
    self.mainTableView.hidden = YES;
    [self.historyTableView reloadData];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.searchTextField) {
        NSString *keyWord = self.searchTextField.text;
        [self saveSearchHistoryAction:keyWord];
    }
    [self.view endEditing:YES];
    return YES;
}

// 保存搜索历史
- (void)saveSearchHistoryAction:(NSString *)searchContent {
    self.historyTableView.hidden = YES;
    self.mainTableView.hidden = NO;
    [self.mainTableView reloadData];
    
    if (self.searchHistoryArray == nil) {
        self.searchHistoryArray = [[NSMutableArray alloc] init];
    }
    for (int index = 0; index < self.searchHistoryArray.count; index++) {
        NSString *string = [self.searchHistoryArray objectAtIndex:index];
        if (string && [string isEqualToString:searchContent]) {
            [self.searchHistoryArray removeObjectAtIndex:index];
        }
    }
    if (searchContent) {
        [self.searchHistoryArray insertObject:searchContent atIndex:0];
    }
    
    // 最多保留十个历史记录
    if (self.searchHistoryArray.count > 10) {
        NSArray *historyArray = [self.searchHistoryArray subarrayWithRange:NSMakeRange(0, 10)];
        self.searchHistoryArray = [NSMutableArray arrayWithArray:historyArray];
    }
    
    NSUserDefaults *userDefaulet = [NSUserDefaults standardUserDefaults];
    [userDefaulet setObject:self.searchHistoryArray forKey:SEARCH_HISTORY_KEY];
}

- (void)savedSearchHistoryArray {
    NSUserDefaults *userDefaulet = [NSUserDefaults standardUserDefaults];
    NSMutableArray *savedArray = [userDefaulet objectForKey:SEARCH_HISTORY_KEY];
    
    if (savedArray == nil) {
        savedArray = [[NSMutableArray alloc] init];
    }
    self.searchHistoryArray = [NSMutableArray arrayWithArray:savedArray];
}
//清空历史
- (void)clearSearchHistoryAction:(id)sender {
    
    NSUserDefaults *userDefaulet = [NSUserDefaults standardUserDefaults];
    [userDefaulet setObject:nil forKey:SEARCH_HISTORY_KEY];
    
    if (self.searchHistoryArray) {
        [self.searchHistoryArray removeAllObjects];
    }
    [self.historyTableView reloadData];
}



@end
