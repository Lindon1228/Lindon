//
//  HttpManager.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "HttpManager.h"
#import "CityModel.h"
#import "StatusModel.h"
#import "DailyModel.h"
@implementation HttpManager

//获取城市天气数据
- (void)getCityWeatherData:(NSString *)ID {
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.heweather.com/x3/weather?cityid=%@&key=4a32ffd8c0494966a5eeb944d39a8cce",ID]]];
    request.tag = 2;
    request.delegate = self;
    [request startAsynchronous];
    
}

//- (void)getCityData {
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"https://api.heweather.com/x3/citylist?search=allchina&key=46aa976249234ec2967ca387ae4f644b"]];
//    request.tag = 1;
//    request.delegate = self;
//    [request startAsynchronous];
//    
//    
//}

- (void)requestFailed:(ASIHTTPRequest *)request {
    if (request.tag==2) {
        if ([self.delegate respondsToSelector:@selector(getWeatherDataFail)]) {
            [self.delegate getWeatherDataFail];
        }
    }
    
    
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    
    if (request.tag == 1) {
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *resultArray = dataDic[@"city_info"];
       // NSLog(@"=========%@",resultArray);
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in resultArray) {
            CityModel *obj = [CityModel cityModelWithCityModelDic:dic];
            [array addObject:obj];
        }
             
        
        if ([self.delegate respondsToSelector:@selector(getCityDataFinish:)]) {
            [self.delegate getCityDataFinish:array];
        }
        
        
        NSLog(@"++++获取城市信息的结果++++%@",request.responseString);
    }else if (request.tag==2) {
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dataDic[@"HeWeather data service 3.0"];
        NSDictionary *dic = [array firstObject];
        StatusModel *obj = [StatusModel statusModelWithStatusModelDic:dic];
        NSArray *dailyArray = dic[@"daily_forecast"];
        
        NSMutableArray *dataArray = [NSMutableArray array];
        for (NSDictionary *aDic in dailyArray) {
            DailyModel *model = [DailyModel dailyModelWithDailyModelDic:aDic];
            [dataArray addObject:model];
        }

        if ([self.delegate respondsToSelector:@selector(getWeatherDataFinish:with:)]) {
            [self.delegate getWeatherDataFinish:obj with:dataArray];
        }
        
//        NSLog(@"------%@",obj.nowObj.tmp);
       NSLog(@"++++获取城市天气信息的结果++++%@",request.responseString);
    }
    
    
    
}







@end




