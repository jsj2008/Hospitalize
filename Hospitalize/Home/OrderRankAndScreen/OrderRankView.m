//
//  OrderRankView.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderRankView.h"
#import "FCMacros.h"
#import "FCCommonUtil.h"

#define LineHeight 42
//#define LineNum 6
@interface OrderRankView() <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGFloat startY;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) UIView *grayBackGroundView;//灰色背景，点击后关闭筛选页面
@property (nonatomic, strong) UIView *whiteBackGroundView;//列表后面的白色背景

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic,strong) NSArray *classArray;//存放类别数组

@end

@implementation OrderRankView

-(instancetype)initWithStartY:(CGFloat)startY{
    self = [self initWithFrame:CGRectMake(0, startY, KmainScreenWidth, 0)];
    
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        
        self.startY = startY;
        self.show = NO;
    }
    return self;

}

-(void)setRowNameArray:(NSArray *)rowNameArray{
    self.height = LineHeight*rowNameArray.count +rowNameArray.count + 4;
    self.classArray = rowNameArray;
}
#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.classArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
    if (!cell) {
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"orderCell"];
    }
    cell.textLabel.text = self.classArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = COLOR666666;
    if (self.hightLightRow >0) {
        if (self.hightLightRow-1 ==indexPath.row) {
          cell.textLabel.textColor = COLORFC7845;
        }
    }
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    //取消之前的高亮行
    if (self.hightLightRow >0) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:self.hightLightRow-1 inSection:0];
            UITableViewCell *usedCell = [tableView cellForRowAtIndexPath:path];
            usedCell.textLabel.textColor = COLOR666666;
    }
    //显示现在的高亮行
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = COLORFC7845;
    // 返回点击数据
    if ([self.delegate respondsToSelector:@selector(orderResultId:)]) {
        [self.delegate orderResultId:indexPath.row];
    }
    [self closeOrderRank];
}
#pragma mark 初始化
//灰色背景
- (UIView *)grayBackGroundView {
    
    if (_grayBackGroundView == nil) {
        _grayBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, _startY, KmainScreenWidth, KmainScreenHeight-_startY)];
        _grayBackGroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        _grayBackGroundView.opaque = NO;
        UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)];
        gesture.delegate = self;
        [_grayBackGroundView addGestureRecognizer:gesture];
    }
    
    return _grayBackGroundView;
}
//白色背景
- (UIView *)whiteBackGroundView {
    
    if (_whiteBackGroundView == nil) {
        _whiteBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KmainScreenWidth, self.height)];
        _whiteBackGroundView.backgroundColor = [UIColor whiteColor];
        _whiteBackGroundView.clipsToBounds = YES;
    }
    
    return _whiteBackGroundView;
}
//主tableview
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KmainScreenWidth, self.height) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.separatorColor = [UIColor colorWithWhite:0 alpha:0.1];
    }
    return _mainTableView;
}

- (void)setShowingViewToDefaultPosition {
    
    self.whiteBackGroundView.frame = CGRectMake(0, 0, KmainScreenWidth, 0);
    self.mainTableView.frame = CGRectMake(0 , 0, KmainScreenWidth, 0);
}

- (void)updateShowingViewPosition {
    self.whiteBackGroundView.frame = CGRectMake(0, 0, KmainScreenWidth, self.height);
    self.mainTableView.frame = CGRectMake(0 , 0, KmainScreenWidth, self.height);
}
//点击灰色背景，关闭排序
- (void)backgroundTapped:(UITapGestureRecognizer *)paramSender {
    if ([self.delegate respondsToSelector:@selector(orderResultCancel)]) {
        [self.delegate orderResultCancel];
    }
    [self closeOrderRank];
}


//点击排序
-(void)orderRank{
    [self.mainTableView reloadData];
    
    [self animateView:self.grayBackGroundView show:!self.show complete:^{
       self.show = !self.show;
    }];
    
}
//关闭排序
- (void)closeOrderRank{
    [self animateView:self.grayBackGroundView show:NO complete:^{
        self.show = NO;
    }];
}
//动画
- (void)animateView:(UIView *)view show:(BOOL)show complete:(void(^)())complete {
    if (show) {
        [self setShowingViewToDefaultPosition];
    
        [self.superview addSubview:view];
        [view addSubview:_whiteBackGroundView];
        [_whiteBackGroundView addSubview:self.mainTableView];
        
        [UIView animateWithDuration:0.2 animations:^{
            [self updateShowingViewPosition];
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
            [_whiteBackGroundView removeFromSuperview];
            [self.mainTableView removeFromSuperview];
        }];
    }
    complete();
}
//子视图手势不响应父视图手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:_whiteBackGroundView]) {
        return NO;
    }
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
