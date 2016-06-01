//
//  StatusModel.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "StatusModel.h"

@implementation StatusModel
- (id)initWithStatusModelDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.nowObj = [NowModel nowModelWithNowModelDic:dic[@"now"]];
                
       
    }
    
    return self;
}
+ (id)statusModelWithStatusModelDic:(NSDictionary *)dic {
    
    return [[[self alloc]initWithStatusModelDic:dic] autorelease];
}

- (void)dealloc {
    self.nowObj = nil;
    self.dailyObj = nil;
    [super dealloc];
}
@end
