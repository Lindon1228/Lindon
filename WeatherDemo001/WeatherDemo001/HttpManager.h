//
//  HttpManager.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "StatusModel.h"
@protocol HttpManagerDelegate;
@interface HttpManager : NSObject<ASIHTTPRequestDelegate>
@property (assign,nonatomic) id<HttpManagerDelegate> delegate;

// 获取城市数据
- (void)getCityData;
//获取城市天气数据
- (void)getCityWeatherData:(NSString *)ID;




@end
@protocol HttpManagerDelegate <NSObject>
@optional
// 获取城市的代理方法
- (void)getCityDataFail;
- (void)getCityDataFinish:(NSArray *)array;

// 获取城市天气的代理方法
- (void)getWeatherDataFail;
- (void)getWeatherDataFinish:(StatusModel *)obj with:(NSArray *)array;
@end





