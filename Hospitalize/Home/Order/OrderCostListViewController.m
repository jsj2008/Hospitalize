//
//  OrderCostListViewController.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/15.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderCostListViewController.h"
#import "OrderCostListTableViewCell.h"
#import "OrderCostLsitHeaderView.h"
#import "OrderCostListModel.h"
#import "OrderRankView.h"

@interface OrderCostListViewController () <UITableViewDelegate,UITableViewDataSource,OrderRankResultDelegate>
//日期筛选
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
//是否支付筛选
@property (weak, nonatomic) IBOutlet UIButton *payButton;

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@property (strong, nonatomic) OrderRankView  *orderRankView;//排序视图



@property (nonatomic, strong) NSMutableArray * sectionSelect;//记录当前section是否选中

@property (nonatomic, strong) NSMutableArray * selectArray;//记录选中的indexPath (indexPath.section,indexPath.row)

@property (nonatomic,strong) NSMutableArray * dataSource;//数据源

@end

@implementation OrderCostListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    [self dateAndPayButtonSet];
    
    
    self.orderRankView = [[OrderRankView alloc]initWithStartY:42];
    self.orderRankView.delegate = self;
    [self.view addSubview:self.orderRankView];
    
    self.selectArray = [NSMutableArray array];
    
    OrderCostListModel *model = [[OrderCostListModel alloc]init];
     OrderCostListModel *model1 = [[OrderCostListModel alloc]init];
    OrderCostListModel *model3 = [[OrderCostListModel alloc]init];
    NSArray *array = @[model,model1,model3];
    NSArray *array2 = @[model1,model1,model1,model1];
    NSArray *array3 = @[model3,model3];
    
    self.dataSource = [NSMutableArray arrayWithObjects:array, array2, array3,nil];
    
    [self sectionUnselect:self.dataSource.count];
    
    
}
//设置一周内，是否支付按钮样式
- (void)dateAndPayButtonSet{
    [self.dateButton setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
    [self.dateButton setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateSelected];
    self.dateButton.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,-90);
    self.dateButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    
    [self.payButton setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
    [self.payButton setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateSelected];
    self.payButton.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,-90);
    self.payButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.dataSource[section];
    return array.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderCostListTableViewCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"OrderCostListTableViewCell" forIndexPath:indexPath];
    NSArray *array = self.dataSource[indexPath.section];
    OrderCostListModel *model = array[indexPath.row];
    listCell.selectButton.selected = model.selected;
    
    return listCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderCostListTableViewCell *listCell = [tableView cellForRowAtIndexPath:indexPath];
    listCell.selectButton.selected = !listCell.selectButton.selected;
    
    NSArray *array = self.dataSource[indexPath.section];
    OrderCostListModel *model = array[indexPath.row];
    model.selected = !model.selected;
    int count =0;
    for (OrderCostListModel*mode in array) {
        if (mode.selected) {
            count++;
        }
    }
    if (count ==array.count) {
        //单独刷新
        [self.sectionSelect replaceObjectAtIndex:indexPath.section withObject:@1];
        NSIndexSet * indexSet = [[NSIndexSet alloc] initWithIndex:indexPath.section];
        [self.mainTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];

    }else{
        [self.sectionSelect replaceObjectAtIndex:indexPath.section withObject:@0];
        NSIndexSet * indexSet = [[NSIndexSet alloc] initWithIndex:indexPath.section];
        [self.mainTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    }
    
    if (listCell.selectButton.selected) {
        [self.selectArray addObject:indexPath];
    }else{
        [self.selectArray removeObject:indexPath];
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    OrderCostLsitHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderCostLsitHeaderView"];
    if (!headView) {
        headView = [[OrderCostLsitHeaderView alloc]initWithReuseIdentifier:@"OrderCostLsitHeaderView"];
        
    }
    headView.selectButton.tag = 100 + section;
    NSNumber *num = self.sectionSelect[section];
    //1为选中 0为未选中
    if ([num isEqualToNumber:@1]){
        headView.showButton.selected = YES;
        headView.selectButton.selected = YES;
    }
    else{
        headView.showButton.selected = NO;
        headView.selectButton.selected = NO;
    }
    [headView.selectButton addTarget:self action:@selector(headerButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    return headView;
}
#pragma mark 点击section
- (void) headerButtonOnClick:(UIButton *)button
{
    
    NSInteger section = button.tag - 100;
    if (!button.selected)
    {
        
        NSArray *array = self.dataSource[section];
        for (int i =0; i <array.count; i++) {
            OrderCostListModel *model = array[i];
            model.selected = YES;
        }
         [self.sectionSelect replaceObjectAtIndex:section withObject:@1];
    }
    else
    {
        NSArray *array = self.dataSource[section];
        for (int i =0; i <array.count; i++) {
            OrderCostListModel *model = array[i];
            model.selected = NO;
        }
        [self.sectionSelect replaceObjectAtIndex:section withObject:@0];
    }
    [self selectAllButtonIsSelect];
    [self.mainTableView reloadData];
    //计算价格
}
#pragma mark 判断 如果全选了 那么全选按钮就变为选中 反之，则不选中
- (void)selectAllButtonIsSelect
{
    NSUInteger totalCount = 0;
    for (NSUInteger i = 0; i < self.dataSource.count; i++)
    {
        NSArray *array = self.dataSource[i];
        totalCount += array.count;
    }
    if (self.selectArray.count == totalCount){
        //全选了
    }else{
        //没有全选
    }
    
}
#pragma mark 默认表头没有被选中
- (void) sectionUnselect:(NSInteger)count
{
    if (_sectionSelect.count == 0)
    {
        _sectionSelect = [NSMutableArray array];
        for (int i = 0; i < count; i++)
        {
            [_sectionSelect addObject:@0];
        }
    }
}
//时间排序
- (IBAction)dateAction:(id)sender {
    if (self.payButton.selected) {
        self.payButton.selected = !self.payButton.selected;
    }
    UIButton *button = sender;
    button.selected  = !button.selected;
    
    self.orderRankView.rowNameArray = @[@"一周内",@"一月内",@"半年内",@"一年内"];
    if (self.orderRankView.show) {
        self.orderRankView.show = NO;
    }
    
    [self.orderRankView orderRank];
}
//支付排序
- (IBAction)payAction:(id)sender {
    if (self.dateButton.selected) {
        self.dateButton.selected = !self.dateButton.selected;
    }
    UIButton *button = sender;
    button.selected  = !button.selected;
    
    self.orderRankView.rowNameArray = @[@"未支付",@"已支付",@"全部"];
    if (self.orderRankView.show) {
        self.orderRankView.show = NO;
    }
    [self.orderRankView orderRank];
}

- (void)orderResultId:(NSInteger)orderById{
    [self checkSelect];
    NSLog(@"选择了第%d行",(int)orderById);
}
- (void)orderResultCancel{
    [self checkSelect];
    NSLog(@"取消了选择");
}

-(void)checkSelect{
    if (self.payButton.selected) {
        self.payButton.selected = !self.payButton.selected;
    }
    if (self.dateButton.selected) {
        self.dateButton.selected = !self.dateButton.selected;
    }
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
