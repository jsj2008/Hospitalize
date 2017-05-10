//
//  DepartmentsListViewController.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "DepartmentsListViewController.h"
#import "DepartmentsViewController.h"
#import "DetpartMentsListTableViewCell.h"
#import "ChineseStringUtil.h"
#import "BATableViewIndex.h"
#import "NMProgressViewController.h"
#import <NioxCore/NioxCore.h>


@interface DepartmentsListViewController ()<UITableViewDelegate, UITableViewDataSource,BATableViewIndexDelegate>

@property(nonatomic, strong)NSMutableArray *mergeSortArray;
@property (nonatomic, strong)NSMutableArray *indexArray;

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong) BATableViewIndex * tableViewIndex;



@end

@implementation DepartmentsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title =@"科室列表";
//    [self GetDeptsReq];
    
    NSArray *array1 = @[@"爱",@"天",@"四",@"年",@"茜",@"科",@"成",@"和",@"啊",@"歌",@"s",@"四四",@"的",@"假",@"后",@"孩",@"茜 佛",@"假过",@"交",@"出",@"宝",@"佛",@"个",@"安抚",@"官方",@"嗷嗷",@"呵呵",@"是 v"];
    [self changeArray:array1];
    

    self.mainTableView.sectionHeaderHeight = 25;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.showsVerticalScrollIndicator = NO;
    [self setExtraCellLineHidden:self.mainTableView];
    
    self.tableViewIndex = [[BATableViewIndex alloc] init];
    self.tableViewIndex =[[BATableViewIndex alloc]initWithFrame:(CGRect){self.view.frame.size.width-15,150,15,self.view.frame.size.height}];
//    self.tableViewIndex.center = CGPointMake((self.view.frame.size.width-15/2), [UIScreen mainScreen].bounds.size.height / 2);
    self.tableViewIndex.tableViewIndexDelegate =self;
    [self.view addSubview:self.tableViewIndex];
    
}


-(void)changeArray:(NSMutableArray *)array{
    NSMutableArray *mutablearray = [array mutableCopy];
    NSMutableArray *mainArray = [mutablearray mutableCopy];
    self.mergeSortArray = [NSMutableArray array];
    self.indexArray = [NSMutableArray array];
    self.indexArray = [ChineseStringUtil IndexArray:mutablearray];
    self.mergeSortArray = [ChineseStringUtil LetterSortArray:mutablearray MainArray:mainArray];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -BATableViewIndexDelaget
/**
 *  触摸到索引时触发
 *
 *  @param tableViewIndex 触发didSelectSectionAtIndex对象
 *  @param index          索引下标
 *  @param title          索引文字
 */
- (void)tableViewIndex:(BATableViewIndex *)tableViewIndex didSelectSectionAtIndex:(NSInteger)index withTitle:(NSString *)title{
    if ([self.mainTableView numberOfSections] > index && index > -1){   // for safety, should always be YES
        [self.mainTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                                    atScrollPosition:UITableViewScrollPositionTop
                                            animated:NO];
    }
    
}

/**
 *  开始触摸索引
 *
 *  @param tableViewIndex 触发tableViewIndexTouchesBegan对象
 */
- (void)tableViewIndexTouchesBegan:(BATableViewIndex *)tableViewIndex{
}
/**
 *  触摸索引结束
 *
 *  @param tableViewIndex
 */
- (void)tableViewIndexTouchesEnd:(BATableViewIndex *)tableViewIndex{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.4;
}

/**
 *  TableView中右边右边索引title
 *
 *  @param tableViewIndex 触发tableViewIndexTitle对象
 *
 *  @return 索引title数组
 */
- (NSArray *)tableViewIndexTitle:(BATableViewIndex *)tableViewIndex{
    
    return _indexArray;
}

#pragma mark - TableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init] ;
    myView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 25)];
    titleLabel.textColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = [NSString stringWithFormat:@"  %@",[self.indexArray objectAtIndex:section]];
    [myView addSubview:titleLabel];
    return myView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.mergeSortArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.mergeSortArray objectAtIndex:section] count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetpartMentsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetpartMentsListTableViewCell" forIndexPath:indexPath];
    cell.name.text = [[self.mergeSortArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DepartmentsViewController *departmentsViewController = [ViewControllerUtil getViewControllerFromHomeStoryboardWithIdentifier:@"DepartmentsViewController"];
    departmentsViewController.titleName = [[self.mergeSortArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:departmentsViewController animated:YES];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}


@end
