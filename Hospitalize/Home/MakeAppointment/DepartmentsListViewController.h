//
//  DepartmentsListViewController.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/12.
//  Copyright © 2017年 feichang. All rights reserved.
//

#import "BaseViewController.h"

@interface DepartmentsListViewController : BaseViewController


@property(nonatomic, assign)int32_t hospId; //医院id
@property(nonatomic, assign)int32_t isMutiDept; //是否支持多级科室(0:否(DEF)，1:是)
@property(nonatomic, assign)int32_t scheduleType; //排班类型(0:普通排班(DEF)，1:互联网排班)
@property(nonatomic, assign)int32_t comDeptId; //通用科室ID


@end
