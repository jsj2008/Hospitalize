//
//  OrderScreenView.m
//  Hospitalize
//
//  Created by 周鑫 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "OrderScreenView.h"
#import "FCMacros.h"
#import "FCCommonUtil.h"
#import "ScreenCollectionViewCell.h"
#import "ScreenCollectionReusableView.h"
#import "OrderScreenSelectData.h"

#define CollectViewMargin 18
#define CollectViewCellMargin 12
#define CollectViewCellHeight 30

#define SectionViewHeightCity 60
#define SectionViewHeight 30

@interface OrderScreenView ()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>

//是否显示所有视图
@property (nonatomic, assign) BOOL isShowAllHospType;//类型
@property (nonatomic, assign) BOOL isShowAllHospLevel;//级别
@property (nonatomic, assign) BOOL isShowAllCities;//城市

@property (nonatomic, strong) UICollectionView *mainCollectionView;//collectionview
@property (nonatomic, strong) UIView *grayBackGroundView;//灰色背景，点击后关闭筛选页面
@property (nonatomic, strong) UIScrollView *whiteBackGroundView;//列表后面的白色背景


@property (nonatomic, assign) CGFloat collectionViewHeight;//collectionview的高度
@property (nonatomic, strong) UIButton *resetButton;//重置按钮
@property (nonatomic, strong) UIButton *confirmButton;//确定按钮

@property (nonatomic, assign) CGFloat startY;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat cellWidth;

@property (nonatomic,strong) NSArray *levelArray;
@property (nonatomic,strong) NSArray *typeArray;
@property (nonatomic,strong) NSArray *cityArray;

@property (nonatomic,strong) NSArray *cityShowArray;//展示的城市数组
@property (nonatomic,strong) NSArray *levelShowArray;//展示的等级数组
@property (nonatomic,strong) NSArray *typeShowArray;//展示的类型数组

@property (nonatomic, strong) OrderScreenSelectData *selectData;//选中的数组

@end

@implementation OrderScreenView

- (instancetype)initWithStartY:(CGFloat)startY {
    self = [self initWithFrame:CGRectMake(0, startY, KmainScreenWidth, 0)];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.selectData = [[OrderScreenSelectData alloc]init];
        self.isShowAllHospType = NO;
        self.isShowAllHospLevel = NO;
        self.isShowAllCities = NO;
        self.cityArray = @[@"杭州",@"重庆",@"成都",@"上海",@"北京",@"广州",@"南京",@"山东",@"乌鲁木齐",@"杭州",@"重庆",@"成都",@"上海",@"北京",@"广州",@"南京",@"山东",@"乌鲁木齐",@"杭州",@"重庆",@"成都"];
        
        self.typeArray = @[@"综合",@"三甲",@"妇幼",@"皮肤",@"口腔",@"综合",@"三甲",@"妇幼",@"皮肤",@"口腔",@"口腔",@"综合",@"三甲",@"妇幼",@"皮肤",@"口腔"];
        self.levelArray = @[@"三甲",@"二级",@"二甲",@"二级",@"一级"];
        self.typeShowArray  = [self partOfHospType];
        self.levelShowArray = [self partOfHospLevel];
        self.cityShowArray = [NSArray array];
        
        self.startY = startY;
        self.show = NO;
        
        self.cellWidth = (KmainScreenWidth - CollectViewMargin*2 - CollectViewCellMargin*3)/4.0;
        
        [self resetHeight];
    }
    return self;
}

- (void)resetHeight {
    // collectionView的高度
    int citiesLinesNum = ceil(self.cityShowArray.count/4.0);
    int hospTypeLinesNum = ceil(self.typeShowArray.count/4.0);
    int hospLevelLinesNum = ceil(self.levelShowArray.count/4.0);
    CGFloat lineHeight = CollectViewCellHeight + CollectViewCellMargin;
    self.collectionViewHeight = lineHeight*(citiesLinesNum + hospTypeLinesNum + hospLevelLinesNum) + SectionViewHeight*2  + 25;
    
    // 重置，确定按钮区域高度
    CGFloat confirmButtonAreaHeight = CollectViewCellHeight + 15*2;
    CGFloat limitedCollectionViewHeight = KmainScreenHeight - self.startY - confirmButtonAreaHeight-50;
    
    if (self.collectionViewHeight > limitedCollectionViewHeight) {
        self.collectionViewHeight = limitedCollectionViewHeight;
    }
    // 整个View的高度
    self.height = self.collectionViewHeight + confirmButtonAreaHeight;
}


- (UICollectionView *)mainCollectionView {
    
    if (_mainCollectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.itemSize = CGSizeMake(self.cellWidth, CollectViewCellHeight);
        flowLayout.headerReferenceSize = CGSizeMake(0, SectionViewHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
//        _mainCollectionView.tag = 200;
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        // 注册Cell
        [_mainCollectionView registerClass:[ScreenCollectionViewCell class] forCellWithReuseIdentifier:@"ScreenCollectionViewCell"];
        // 注册sectionHeader
        [_mainCollectionView registerClass:[ScreenCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ScreenCollectionReusableView"];
    }
    
    return _mainCollectionView;
}

- (UIView *)grayBackGroundView {
    
    if (_grayBackGroundView == nil) {
        _grayBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, self.startY, KmainScreenWidth, KmainScreenHeight)];
        _grayBackGroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        _grayBackGroundView.opaque = NO;
        UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundAction:)];
        gesture.delegate = self;
        [_grayBackGroundView addGestureRecognizer:gesture];
    }
    
    return _grayBackGroundView;
}

- (UIScrollView *)whiteBackGroundView {
    
    if (_whiteBackGroundView == nil) {
        _whiteBackGroundView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.startY, KmainScreenWidth, self.height)];
        _whiteBackGroundView.backgroundColor = [UIColor whiteColor];
        _whiteBackGroundView.clipsToBounds = YES;
    }
    
    return _whiteBackGroundView;
}
//重置按钮
- (UIButton *)resetButton {
    if (_resetButton == nil) {
        _resetButton = [[UIButton alloc] initWithFrame:CGRectMake(KmainScreenWidth/2 - 10 - self.cellWidth, self.height-15-CollectViewCellHeight, self.cellWidth, CollectViewCellHeight)];
        [_resetButton setTitleColor:COLORFC7845 forState:UIControlStateNormal];
        _resetButton.backgroundColor = [UIColor whiteColor];
        _resetButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
        [_resetButton.layer setBorderColor:COLORFC7845.CGColor];
        _resetButton.layer.borderWidth = 1;
         [_resetButton.layer setCornerRadius:4];
        [_resetButton addTarget:self action:@selector(resetButtonAction) forControlEvents:UIControlEventTouchUpInside];
       
    }
    
    return _resetButton;
}
//确认按钮
- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(KmainScreenWidth/2 + 10, self.height-15-CollectViewCellHeight, self.cellWidth, CollectViewCellHeight)];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmButton setBackgroundColor:COLORFC7845];
        _confirmButton.titleLabel.textColor = [UIColor whiteColor];
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmButton.layer setCornerRadius:4.0f];
        [_confirmButton addTarget:self action:@selector(confirmButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _confirmButton;
}
#pragma  mark Action
//重置
- (void)resetButtonAction{
    
}
//确认
-(void)confirmButtonAction{
    // 关闭筛选画面
    [self closeScreenView];

    
}
//背景被点击
- (void)backgroundAction:(UITapGestureRecognizer *)gesture {
    [self closeScreenView];
}
//点击向下箭头
- (void)sectionMoreButtonAction:(id)sender {
    
    long i = [(UIButton *)sender tag];
    
    if (i == 0) {
        if (self.isShowAllCities) {
            self.isShowAllCities = NO;
            self.cityShowArray = [NSArray array];
        } else {
            self.isShowAllCities = YES;
            self.cityShowArray = self.cityArray;
        }
    } else if (i == 1)  {
        if (self.isShowAllHospType) {
            self.typeShowArray = [self partOfHospType];
            self.isShowAllHospType = NO;
        } else {
            self.isShowAllHospType = YES;
            self.typeShowArray = _typeArray;
        }
    } else if (i == 2)  {
        if (self.isShowAllHospLevel) {
            self.isShowAllHospLevel = NO;
            self.levelShowArray = [self partOfHospLevel];
        } else {
            self.isShowAllHospLevel = YES;
            self.levelShowArray = self.levelArray;
        }
    }
    
    
    [self resetHeight];
    [self updateShowingViewPosition];
    
    [self.mainCollectionView reloadData];
}
//取一部分数据，制造出缩放的效果
- (NSMutableArray *)partOfHospType {
    NSMutableArray *retArray = [NSMutableArray array];
    for (int i = 0; i < 8; i ++) {
        if (i < _typeArray.count) {
            [retArray addObject:_typeArray[i]];
        }
    }
    return retArray;
}
//取一部分数据，制造出缩放的效果
- (NSMutableArray *)partOfHospLevel {
    NSMutableArray *retArray = [NSMutableArray array];
    for (int i = 0; i < 4; i ++) {
        if (i < _levelArray.count) {
            [retArray addObject:_levelArray[i]];
        }
    }
    return retArray;
}


//关闭筛选页
-(void)closeScreenView{
    [self animateBackGroundView:self.grayBackGroundView show:NO complete:^{
        [self animateTableViewShow:NO complete:^{
            self.show = NO;
        }];
    }];
}
//点击筛选按钮
-(void)orderScreen{
    [self resetHeight];
    [self.mainCollectionView reloadData];
    [self animateBackGroundView:self.grayBackGroundView show:!self.show complete:^{
        [self animateTableViewShow:!self.show complete:^{
            self.show = !self.show;
        }];
    }];
    
}

- (void)animateBackGroundView:(UIView *)view show:(BOOL)show complete:(void(^)())complete {
    if (show) {
        
        [self.superview addSubview:view];
        [view.superview addSubview:self];
        
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    }
    complete();
}

- (void)animateTableViewShow:(BOOL)show complete:(void(^)())complete {
    
    if (show) {
        [self setShowingViewToDefaultPosition];
        
        [UIView animateWithDuration:0.2 animations:^{
            
            [self.superview addSubview:self.whiteBackGroundView];
            // 中间的选择部分
            [self.whiteBackGroundView addSubview:self.mainCollectionView];
            // 重置和确定按钮
            [self.whiteBackGroundView addSubview:self.resetButton];
            [self.whiteBackGroundView addSubview:self.confirmButton];
            [self updateShowingViewPosition];
        } completion:^(BOOL finished) {
            
        }];
    } else {
        
        [UIView animateWithDuration:0.2 animations:^{
            
        } completion:^(BOOL finished) {
            [self.mainCollectionView removeFromSuperview];
            [self.whiteBackGroundView removeFromSuperview];
            [self.resetButton removeFromSuperview];
            [self.confirmButton removeFromSuperview];
        }];
    }
    complete();
}

- (void)setShowingViewToDefaultPosition {
    self.whiteBackGroundView.frame = CGRectMake(0, self.startY, KmainScreenWidth, 0);
    self.mainCollectionView.frame = CGRectMake(15, 0, KmainScreenWidth - 15*2, 0);
    self.confirmButton.frame = CGRectMake(KmainScreenWidth/2 + 10+10, 0, self.cellWidth+20, 0);
    self.resetButton.frame = CGRectMake(KmainScreenWidth/2 - 10 - self.cellWidth-10, 0, self.cellWidth+20, 0);
}

- (void)updateShowingViewPosition {
    
    self.whiteBackGroundView.frame = CGRectMake(0, self.startY, KmainScreenWidth, self.height);
    self.mainCollectionView.frame = CGRectMake(15, 0, KmainScreenWidth - 15*2, self.collectionViewHeight);
    self.confirmButton.frame = CGRectMake(KmainScreenWidth/2 + 10+10, self.height-15-CollectViewCellHeight, self.cellWidth+20, CollectViewCellHeight);
    self.resetButton.frame = CGRectMake(KmainScreenWidth/2 - 10 - self.cellWidth-10, self.height-15-CollectViewCellHeight, self.cellWidth+20, CollectViewCellHeight);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section ==0) {
        return self.cityShowArray.count;
    }
    if (section == 1) {
        return self.typeShowArray.count;
    } else if (section == 2) {
        return self.levelShowArray.count;
    }else{
        return 0;
    }

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;

}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ScreenCollectionViewCell * cell = (ScreenCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"ScreenCollectionViewCell" forIndexPath:indexPath];
    //地址
    if (indexPath.section == 0) {
        if (indexPath.row < self.cityShowArray.count) {
            if (self.selectData.cityName &&[self.selectData.cityName isEqualToString:self.cityShowArray[indexPath.row]]) {
                [cell setSelectedTitle:self.cityShowArray[indexPath.row]];
            }else{
              [cell setNotSelectedTitle:self.cityShowArray[indexPath.row]];
            }
            
        }
    }else if (indexPath.section ==1){
        if (indexPath.row < self.typeShowArray.count) {
            
            if (self.selectData.typeName &&[self.selectData.typeName isEqualToString:self.typeShowArray[indexPath.row]]) {
                [cell setSelectedTitle:self.typeShowArray[indexPath.row]];
            }else{
                [cell setNotSelectedTitle:self.typeShowArray[indexPath.row]];
            }
        }
    }else if (indexPath.section ==2){
        if (indexPath.row < self.levelShowArray.count) {
            if (self.selectData.levelName  &&[self.selectData.levelName isEqualToString:self.levelShowArray[indexPath.row]]) {
                [cell setSelectedTitle:self.levelShowArray[indexPath.row]];
            }else{
                [cell setNotSelectedTitle:self.levelShowArray[indexPath.row]];
            }
        }
    }
    return cell;
    
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        ScreenCollectionReusableView *headerView = (ScreenCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ScreenCollectionReusableView" forIndexPath:indexPath];
        
        [headerView.moreButton setTag:indexPath.section];
        
        if (indexPath.section == 0) {
            [headerView showCityArea:YES];
            headerView.sectionTitleLabel.text = nil;
            headerView.moreButton.selected = self.isShowAllCities;
            
//            headerView.selectedMsgLabel.text = @"";
            
            //重新定位
//            [headerView.locationButton addTarget:self action:@selector(relocationButtonAction) forControlEvents:UIControlEventTouchUpInside];
            
            if (self.selectData.cityName) {
                headerView.cityNameLabel.text = self.selectData.cityName;
            }else{
              headerView.cityNameLabel.text = @"定位";
            }
            
        } else {
            // 隐藏点位城市名称，重新定位等信息
            [headerView showCityArea:NO];
            if (indexPath.section == 1) {
                    
                headerView.sectionTitleLabel.text = @"类型";
                headerView.moreButton.selected = self.isShowAllHospType;
                if (self.selectData.typeName) {
                    headerView.selectedMsgLabel.text = self.selectData.typeName;
                    [headerView setSelecedMesLabelColor];
                }else{
                  headerView.selectedMsgLabel.text = @"不限";
                }
                
                } else if (indexPath.section == 2) {
                    
                    headerView.sectionTitleLabel.text =@"级别";
                    headerView.moreButton.selected = self.isShowAllHospLevel;
                    if (self.selectData.levelName) {
                        headerView.selectedMsgLabel.text = self.selectData.levelName;
                        [headerView setSelecedMesLabelColor];
                    }else{
                        headerView.selectedMsgLabel.text = @"不限";
                    }
            }
        }
        
        [headerView.moreButton addTarget:self action:@selector(sectionMoreButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        return headerView;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section ==0) {
      return CGSizeMake(KmainScreenWidth, 45);
    }else{
        return CGSizeMake(KmainScreenWidth, 30);
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row < self.cityShowArray.count) {
            self.selectData.cityName = self.cityShowArray[indexPath.row];
        }
    } else {
        if (indexPath.section == 1) {
            if (indexPath.row < self.typeShowArray.count) {
                self.selectData.typeName = self.typeShowArray[indexPath.row];
                
            }
        } else if (indexPath.section == 2) {
            if (indexPath.row < self.levelShowArray.count) {
                self.selectData.levelName = self.levelShowArray[indexPath.row];
                
            }
        }
    }
    
    [self.mainCollectionView reloadData];
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
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
