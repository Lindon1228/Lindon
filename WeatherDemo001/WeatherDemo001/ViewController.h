//
//  ViewController.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpManager.h"
@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIScrollView *bigScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *smallScrollView;
@property (retain,nonatomic) HttpManager *manager;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UILabel *degreeLabel;
@property (retain, nonatomic) IBOutlet UILabel *weatherLabel;
@property (retain,nonatomic) NSMutableArray *cityArray;
@property (copy,nonatomic) NSString *cityName;
@property (copy,nonatomic) NSString *cityID;
@property (retain,nonatomic) NSMutableArray *cityIDrray;
@property (retain,nonatomic) NSMutableArray *dataArray;
@property (retain,nonatomic) NSMutableArray *imageViewArray;
@property (copy,nonatomic) NSString *deleteCityName;
@property (assign,nonatomic) int offet;
@end

