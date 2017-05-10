//
//  ElectronicMedicalRecordsViewController.h
//  Hospitalize
//
//  Created by 宋明月 on 2017/4/18.
//  Copyright © 2017年 feichang. All rights reserved.
//  电子病例

#import <UIKit/UIKit.h>

@interface ElectronicMedicalRecordsViewController : UIViewController

@property(nonatomic, assign)ino64_t patientId; //就诊人ID
@property(nonatomic, copy)NSString *reportId; //报告ID
@property(nonatomic, copy)NSString *reportType; //报告类型,LIS或PACS
@property(nonatomic, assign)ino64_t hospId; //医院ID

@end
