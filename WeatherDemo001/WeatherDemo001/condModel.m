//
//  condModel.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "condModel.h"

@implementation condModel

- (id)initWithcondModelDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.cond_d = dic[@"code_d"];
    }
    return self;
}
+ (id)condModelWithcondModelDic:(NSDictionary *)dic {
    return [[[self alloc]initWithcondModelDic:dic] autorelease];
}
- (void)dealloc {
    self.cond_d = nil;
    [super dealloc];
}
@end
