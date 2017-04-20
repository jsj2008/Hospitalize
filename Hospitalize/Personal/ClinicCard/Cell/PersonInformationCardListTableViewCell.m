//
//  PersonInformationCardListTableViewCell.m
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "PersonInformationCardListTableViewCell.h"
#import "FCCommonUtil.h"
#import "FCMacros.h"
#import "CardCollectionViewFlowLayout.h"
#import "CardCollectionViewCell.h"

@implementation PersonInformationCardListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)cellReload{
    CardCollectionViewFlowLayout *layout  = [[CardCollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = -70;
    self.listCollectionView.collectionViewLayout = layout;
    self.listCollectionView.delegate = self;
    self.listCollectionView.dataSource = self;
    self.listCollectionView.allowsSelection = NO;
    self.listCollectionView.userInteractionEnabled = NO;
}

#pragma mark -UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width, 120);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cellNumber;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        cell.bigBackgroundView.backgroundColor = COLOR85B7F9;
    } else {
        cell.bigBackgroundView.backgroundColor = COLORBDE0BC;
    }
    return cell;
    
}

@end
