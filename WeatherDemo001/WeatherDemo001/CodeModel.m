//
//  CodeModel.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "CodeModel.h"

@implementation CodeModel


- (id)initWithCodeDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.code = dic[@"code"];
        self.txt = dic[@"txt"];
    }
    
    
    return self;
}
+ (id)codeModelWithCodeDic:(NSDictionary *)dic {
    
    return [[[self alloc]initWithCodeDic:dic] autorelease];
}


- (void)dealloc {
    
    
    self.code = nil;
    self.txt = nil;
    [super dealloc];
}
    
    
@end
