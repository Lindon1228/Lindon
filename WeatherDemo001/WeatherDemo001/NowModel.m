//
//  NowModel.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "NowModel.h"

@implementation NowModel

- (id)initWithNowModelDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.tmp = dic[@"tmp"];
        self.condObj = [CodeModel codeModelWithCodeDic:dic[@"cond"]];
    }
    
    
    return self;
}
+ (id)nowModelWithNowModelDic:(NSDictionary *)dic {
    return [[[self alloc]initWithNowModelDic:dic] autorelease];
}

- (void)dealloc {
    self.tmp = nil;
    self.condObj = nil;
    [super dealloc];
}
@end
