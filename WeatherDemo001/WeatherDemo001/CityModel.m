//
//  CityModel.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

- (id)initWithCityModelDic:(NSDictionary *)dic {
    self = [super init];
    
    if (self) {
        
        self.city = dic[@"city"];
        self.cnty = dic[@"cnty"];
        self.ID = dic[@"id"];
        self.lat = dic[@"lat"];
        self.lon = dic[@"lon"];
        self.prov = dic[@"prov"];

        
        
        
    }
    
    return self;
}
+ (id)cityModelWithCityModelDic:(NSDictionary *)dic {
    
    return [[[self alloc]initWithCityModelDic:dic] autorelease];
}

- (id)initWithCityModelFMResultSet:(FMResultSet *)set {
    self = [super init];
    if (self) {
        self.city = [set stringForColumn:@"city"];
        self.cnty = [set stringForColumn:@"cnty"];
        self.ID = [set stringForColumn:@"city_id"];
        self.lat = [set stringForColumn:@"lat"];
        self.lon = [set stringForColumn:@"lon"];
        self.prov = [set stringForColumn:@"prov"];
        
        
    }
    return self;
}
+ (id)cityModelWithCityModelFMResultSet:(FMResultSet *)set {
    
    return [[[self alloc]initWithCityModelFMResultSet:set] autorelease];
}






- (void)dealloc {
    
    self.city = nil;
    self.cnty = nil;
    self.ID = nil;
    self.lat = nil;
    self.lon = nil;
    self.prov = nil;
    
    [super dealloc];
}

@end
