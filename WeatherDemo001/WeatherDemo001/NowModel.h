//
//  NowModel.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeModel.h"
@interface NowModel : NSObject
@property (copy,nonatomic) NSString *tmp;
@property (retain,nonatomic) CodeModel *condObj;

- (id)initWithNowModelDic:(NSDictionary *)dic;
+ (id)nowModelWithNowModelDic:(NSDictionary *)dic;


@end
