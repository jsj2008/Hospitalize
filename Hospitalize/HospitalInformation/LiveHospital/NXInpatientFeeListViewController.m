//
//  NXInpatientFeeListViewController.m
//  Niox
//
//  Created by 侯明和 on 15/10/21.
//  Copyright © 2015年 neusoft. All rights reserved.
//

#import "NXInpatientFeeListViewController.h"
//#import "AMAVisitInAPI.h"
//#import "NXInHospitalViewController.h"

@interface NXInpatientFeeListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dataArr;
}
@property (strong, nonatomic) IBOutlet UITableView *dateChooseTableView;

@end

@implementation NXInpatientFeeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateChooseTableView.delegate = self;
    self.dateChooseTableView.dataSource = self;
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    self.dateChooseTableView.tableFooterView = view;
//    [self getInpatientFeeListAPI];
    // Do any additional setup after loading the view.
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section < dataArr.count) {
        return ((NSMutableArray *)[dataArr objectAtIndex:section]).count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *baseView = [[UIView alloc]init];
    baseView.frame = CGRectMake(0,
                                0,
                                ScreenWidth,
                                35);
    baseView.backgroundColor = [UIColor colorWithRed:245/255.0f
                                               green:245/255.0f
                                                blue:245/255.0f
                                               alpha:1.0f];
    UIView *whiteView = [[UIView alloc]init];
    whiteView.frame = CGRectMake(0,
                                 0,
                                 baseView.frame.size.width,
                                 35);
    whiteView.backgroundColor = [UIColor whiteColor];
    [baseView addSubview:whiteView];
    UILabel *sectionLabel = [[UILabel alloc]init];
    sectionLabel.frame = CGRectMake(20,
                                    0,
                                    whiteView.frame.size.width-36,
                                    CGRectGetHeight(baseView.frame)-1);
    sectionLabel.textAlignment = NSTextAlignmentLeft;
    NSString *labelTextStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    if (section < dataArr.count) {
//        NXTFInpatientDailyFee *model = ((NSMutableArray *)[dataArr objectAtIndex:section]).firstObject;
        NSDate *dateMonth = [dateFormatter dateFromString:@"201704"];
        [dateFormatter setDateFormat:@"yyyyMM"];
        if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:[dateFormatter stringFromDate:dateMonth]]) {
            labelTextStr = @"本月";
        }else{
            [dateFormatter setDateFormat:@"yyyy年MM月"];
            labelTextStr = [dateFormatter stringFromDate:dateMonth];
        }
    }
    sectionLabel.text = labelTextStr;
    sectionLabel.font = [UIFont systemFontOfSize:15.0f];
    sectionLabel.textColor = [UIColor colorWithRed:160/255.0f
                                             green:160/255.0f
                                              blue:160/255.0f
                                             alpha:1.0f];
    [whiteView addSubview:sectionLabel];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.frame = CGRectMake(0,
                                CGRectGetMaxY(sectionLabel.frame)-2,
                                CGRectGetWidth(whiteView.frame),
                                1);
    lineView.backgroundColor = [UIColor colorWithRed:234/255.0f
                                               green:234/255.0f
                                                blue:234/255.0f
                                               alpha:1.0f];
    [whiteView addSubview:lineView];
    return baseView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    if (indexPath.section < dataArr.count) {
//        NXTFInpatientDailyFee *model = [[dataArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//        NXTFInpatientDailyFee *model = nil;
        if ([[dataArr objectAtIndex:indexPath.section] count] > indexPath.row) {
//            model = [[dataArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        }
        NSDate *date = [dateFormatter dateFromString:@"201704"];
        [dateFormatter setDateFormat:@"MM月dd日"];
        cell.textLabel.text = [dateFormatter stringFromDate:date];
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"￥200"];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14.0f];
        if (indexPath.row == ((NSMutableArray *)[dataArr objectAtIndex:indexPath.section]).count-1 && dataArr.count !=1&& indexPath.section !=  dataArr.count - 1 ) {
            UIView *lineView = [[UIView alloc]init];
            lineView.frame = CGRectMake(0,
                                        CGRectGetHeight(cell.frame)-5,
                                        ScreenWidth,
                                        5);
            lineView.backgroundColor = [UIColor colorWithRed:245/255.0f
                                                       green:245/255.0f
                                                        blue:245/255.0f
                                                       alpha:1.0f];
            [cell addSubview:lineView];
        }
    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < dataArr.count) {
        if (((NSArray *)[dataArr objectAtIndex:indexPath.section]).count > indexPath.row) {
//            NXTFInpatientDailyFee *model = [[dataArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            
#if 0 // 测试临时
            switch (self.state_refresh) {
                case INPATIENT_NOTREFRESH:
                {
                    [self.delegate selectDate:model.feeDate isRefursh:YES status:INPATIENT_REFRESH];
                    [self.navigationController popViewControllerAnimated:YES];
                }
                    break;
                case OUTPATIENT_NOTREFRESH:
                {
                    [self.delegate selectDate:model.feeDate isRefursh:YES status:OUTPATIENT_REFRESH];//正向传值，这个status不需要，下面会传
                    [self.navigationController popViewControllerAnimated:YES];
                }
                    break;
                    
                default:
                    break;
            }
#endif
            
            

                
                if ([self.delegate respondsToSelector:@selector(selectDate:isRefursh:status:)]) {
                    
                    [self.delegate selectDate:@"201704" isRefursh:YES status:0];
                    
                    [self.navigationController popViewControllerAnimated:YES];
                }
        }
    }
}
#pragma mark 数据排序分组处理
- (NSMutableArray *)sort:(NSMutableArray *)arr
{
//    NSMutableArray *array = (NSMutableArray *)[arr sortedArrayUsingComparator:^NSComparisonResult(NXTFInpatientDailyFee * obj1, NXTFInpatientDailyFee * obj2) {
//        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//        [formatter setDateFormat:@"yyyyMMdd"];
//        NSDate *date1 = [formatter dateFromString:obj1.feeDate];
//        NSDate *date2 = [formatter dateFromString:obj2.feeDate];
//        NSComparisonResult result = [date1 compare:date2];
//        return result == NSOrderedAscending;
//    }];
//    return array;
    return nil;
}
- (NSMutableArray *)groupingWith:(NSMutableArray *)arr
{
//    NSMutableArray *returnArray = [[NSMutableArray alloc]initWithCapacity:0];
//    NSMutableArray *array = [NSMutableArray arrayWithArray:arr];
//    
//    for (int i = 0; i < array.count; i ++) {
//        NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc]init];
//        [dateFormatter1 setDateFormat:@"yyyyMMdd"];
//        NXTFInpatientDailyFee *model1 = [array objectAtIndex:i];
//        NSDate *date1 = [dateFormatter1 dateFromString:model1.feeDate];
//        [dateFormatter1 setDateFormat:@"yyyyMM"];
//        NSString *string1 = [dateFormatter1 stringFromDate:date1];
//        NSMutableArray *containerArr = [[NSMutableArray alloc]initWithCapacity:0];
//        [containerArr addObject:model1];
//        for (int j = i + 1; j < array.count; j ++) {
//            NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc]init];
//            [dateFormatter2 setDateFormat:@"yyyyMMdd"];
//            NXTFInpatientDailyFee *model2 = [array objectAtIndex:j];
//            NSDate *date2 = [dateFormatter2 dateFromString:model2.feeDate];
//            [dateFormatter2 setDateFormat:@"yyyyMM"];
//            NSString *string2 = [dateFormatter2 stringFromDate:date2];
//
//            if ([string1 compare:string2] == NSOrderedSame) {
//                [containerArr addObject:model2];
//                [array removeObjectAtIndex:j];
//                j = j - 1;
//            }
//        }
//        [returnArray addObject:containerArr];
//    }
//    return returnArray;
    return nil;
}
#pragma mark API
//- (void)getInpatientFeeListAPI{
//    [NXProgressViewController progressViewWithBody:NSLocalizedString(@"LoadingPleaseWait", @"") type:1 hidesAfter:0 show:YES];
//    @weakify(self);
//    [AMAVisitInAPI getInpatientFeeList:[self.patientId intValue]
//                                hospId:[self.hospId intValue]
//                             recordId:[self.recordId intValue]
//                               success:^(NXTFGetInpatientFeeListResp *model) {
//                                   @strongify(self);
//                                   NSMutableArray *sortArr = [self sort:model.dailyFees];
//                                   dataArr = [[NSMutableArray alloc]initWithArray:[self groupingWith:sortArr]];
//                                   [self.dateChooseTableView reloadData];
//                                   [NXProgressViewController dismissCurrentViewController];
//                               } failure:^(NSError *error) {
//                                   [NXProgressViewController dismissCurrentViewController];
//                               }];
//
//}
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
