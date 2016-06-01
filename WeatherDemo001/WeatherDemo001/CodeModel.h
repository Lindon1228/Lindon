//
//  CodeModel.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/26.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodeModel : NSObject
@property (copy,nonatomic) NSString *code;
@property (copy,nonatomic) NSString *txt;

- (id)initWithCodeDic:(NSDictionary *)dic;
+ (id)codeModelWithCodeDic:(NSDictionary *)dic;
@end
