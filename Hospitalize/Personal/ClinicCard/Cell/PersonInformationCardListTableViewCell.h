//
//  PersonInformationCardListTableViewCell.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/20.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonInformationCardListTableViewCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UIButton *addButton;


@property (weak, nonatomic) IBOutlet UICollectionView *listCollectionView;


@property(nonatomic, assign)int cellNumber;

-(void)cellReload;




@end
