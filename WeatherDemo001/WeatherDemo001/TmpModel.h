//
//  TmpModel.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TmpModel : NSObject
@property (copy,nonatomic) NSString *max;
@property (copy,nonatomic) NSString *min;

- (id)initWithTmpModelDic:(NSDictionary *)dic;
+ (id)tmpModelWithTmpModelDic:(NSDictionary *)dic;

@end
