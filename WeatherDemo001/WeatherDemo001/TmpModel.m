//
//  TmpModel.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "TmpModel.h"

@implementation TmpModel
- (id)initWithTmpModelDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.max = dic[@"max"];
        self.min = dic[@"min"];
    }
    return self;
}
+ (id)tmpModelWithTmpModelDic:(NSDictionary *)dic {
    return [[[self alloc]initWithTmpModelDic:dic] autorelease];
}

- (void)dealloc {
    self.max = nil;
    self.min = nil;
    [super dealloc];
}
@end



