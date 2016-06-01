//
//  Database.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "Database.h"
#import "FMDB.h"
#import "CityModel.h"
static FMDatabase *__db = nil;

@implementation Database
// 取出CityTable表中的数据
+ (NSMutableDictionary *)selectDataFromCityTable {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    FMResultSet *set = [__db executeQuery:@"select * from cityTable"];
    NSMutableArray *provArray = [NSMutableArray array];
    while ([set next]) {
        CityModel *obj = [CityModel cityModelWithCityModelFMResultSet:set];
        if (![provArray containsObject:obj.prov]) {
            [provArray addObject:obj.prov];
               }
           }
    
        for (int i = 0; i <provArray.count; i++) {
            NSMutableArray *cityArray = [NSMutableArray array];
            NSString *provName = provArray[i];
           FMResultSet *set = [__db executeQuery:@"select * from cityTable where prov like ?",provName];
            while ([set next]) {
                CityModel *obj = [CityModel cityModelWithCityModelFMResultSet:set];
               // NSLog(@"%@",obj.city);
                [cityArray addObject:obj];
            }
    
            [dic setObject:cityArray forKey:provName];
        }

    
    
    
    //By:(NSMutableArray *)array
//    for (int i = 0; i <array.count; i++) {
//        NSMutableArray *cityArray = [NSMutableArray array];
//        NSString *provName = array[i];
//       FMResultSet *set = [__db executeQuery:@"select * from cityTable where prov like ?",provName];
//        while ([set next]) {
//            CityModel *obj = [CityModel cityModelWithCityModelFMResultSet:set];
//            NSLog(@"%@",obj.city);
//            [cityArray addObject:obj];
//        }
//        
//        [dic setObject:cityArray forKey:provName];
//    }
    
    
    
    
    return dic;
}



// 插入数据
+ (void)insertDataIntoCityTable:(NSArray *)array {
    for (CityModel *obj in array) {
        
        [__db executeUpdate:@"insert into cityTable (city,cnty,city_id,lat,lon,prov) values (?,?,?,?,?,?)",obj.city,obj.cnty,obj.ID,obj.lat,obj.lon,obj.prov];
        
    }
    
    
    
    
}
// 创建一个表
+ (void)createDatabaseNewCityTable {
//    if (!__db) {
//        __db = [[FMDatabase alloc]initWithPath:[self getPath]];
//        [__db open];
//        
//        [__db executeUpdate:@"create table if not exists cityTable (id integer primary key autoincrement,city text,cnty text,city_id text,lat text,lon text,prov text)"];
//        
//        
//    }
    NSString *path = [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"];
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:[self getPath]]) {
        [manager copyItemAtPath:path toPath:[self getPath] error:nil];
    }
    __db = [[FMDatabase alloc]initWithPath:[self getPath]];
    [__db open];

    
    
    
}
+ (NSString *)getPath {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database.sqlite"];
}

@end
