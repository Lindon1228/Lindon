//
//  CityModel.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"
@interface CityModel : NSObject
@property (copy,nonatomic) NSString *city;
@property (copy,nonatomic) NSString *cnty;
@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *lat;
@property (copy,nonatomic) NSString *lon;
@property (copy,nonatomic) NSString *prov;

- (id)initWithCityModelDic:(NSDictionary *)dic;
+ (id)cityModelWithCityModelDic:(NSDictionary *)dic;

- (id)initWithCityModelFMResultSet:(FMResultSet *)set;
+ (id)cityModelWithCityModelFMResultSet:(FMResultSet *)set;

@end
