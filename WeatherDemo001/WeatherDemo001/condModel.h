//
//  condModel.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface condModel : NSObject
@property (copy,nonatomic) NSString *cond_d;

- (id)initWithcondModelDic:(NSDictionary *)dic;
+ (id)condModelWithcondModelDic:(NSDictionary *)dic;
@end


