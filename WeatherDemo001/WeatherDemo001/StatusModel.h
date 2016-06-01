//
//  StatusModel.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NowModel.h"
#import "DailyModel.h"
@interface StatusModel : NSObject
@property (retain,nonatomic) NowModel *nowObj;
@property (retain,nonatomic) DailyModel *dailyObj;

- (id)initWithStatusModelDic:(NSDictionary *)dic;
+ (id)statusModelWithStatusModelDic:(NSDictionary *)dic;

@end
