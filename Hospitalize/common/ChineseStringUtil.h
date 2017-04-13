//
//  ChineseStringUtil.h
//  nicai
//
//  Created by 宋明月 on 15/8/1.
//  Copyright (c) 2015年 QuCai. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ChineseStringUtil : NSObject

@property(copy,nonatomic)NSString *string;
@property(copy,nonatomic)NSString *pinYin;

//-----  返回tableview右方indexArray
+(NSMutableArray*)IndexArray:(NSArray*)stringArr;

//-----  返回联系人
+(NSMutableArray*)LetterSortArray:(NSMutableArray*)stringArr MainArray:(NSMutableArray *)array;

@end
