//
//  Database.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Database : NSObject
// 创建一个表
+ (void)createDatabaseNewCityTable;
// 插入数据
+ (void)insertDataIntoCityTable:(NSArray *)array;
// 取出CityTable表中的数据
+ (NSMutableDictionary *)selectDataFromCityTable;



@end
