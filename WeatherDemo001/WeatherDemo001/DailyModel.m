//
//  DailyModel.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "DailyModel.h"

@implementation DailyModel

- (id)initWithDailyModelDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.date = dic[@"date"];
        self.tmpObj = [TmpModel tmpModelWithTmpModelDic:dic[@"tmp"]];
        self.condObj = [condModel condModelWithcondModelDic:dic[@"cond"]];
    }
    return self;
}
+ (id)dailyModelWithDailyModelDic:(NSDictionary *)dic {
    
    return [[[self alloc]initWithDailyModelDic:dic] autorelease];
}


- (void)dealloc {
    
    self.date = nil;
    self.tmpObj = nil;
    self.condObj = nil;
    [super dealloc];
}

@end
