//
//  DailyModel.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TmpModel.h"
#import "condModel.h"
@interface DailyModel : NSObject
@property (copy,nonatomic) NSString *date;
@property (retain,nonatomic) TmpModel *tmpObj;
@property (retain,nonatomic) condModel *condObj;

- (id)initWithDailyModelDic:(NSDictionary *)dic;
+ (id)dailyModelWithDailyModelDic:(NSDictionary *)dic;

@end
