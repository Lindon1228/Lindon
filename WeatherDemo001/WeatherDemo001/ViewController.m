//
//  ViewController.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//
#import "ViewController.h"
#import "CityManagerVC.h"
#import "StatusModel.h"
#import "DailyModel.h"
#import "UIImageView+WebCache.h"
#import "AirQualityViewController.h"
//#define KbigScrollSize   self.bigScrollView.bounds.size.width;

@interface ViewController ()<HttpManagerDelegate,UIScrollViewDelegate>
@property (retain,nonatomic) StatusModel *obj;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    
//    self.cityName = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityName"];
//    self.cityID = [[NSUserDefaults standardUserDefaults] objectForKey:@"city_id"];
    NSLog(@"---------------%@",self.cityName);
       
    
    if (!self.cityName) {
        self.cityName = @"北京";
        self.cityID = @"CN101010100";
            }else{
        NSInteger index = self.bigScrollView.contentOffset.x/self.bigScrollView.bounds.size.width;
        self.cityID = self.cityIDrray[index];
        self.cityName = self.cityArray[index];

    }
    if (![self.cityArray containsObject:self.cityName]) {
        [self.cityArray addObject:self.cityName];
        [self.cityIDrray addObject:self.cityID];
        [[NSUserDefaults standardUserDefaults] setObject:self.cityArray forKey:@"cityArray"];
        [[NSUserDefaults standardUserDefaults] setObject:self.cityIDrray forKey:@"cityIDArray"];
        
    }

    [self.manager getCityWeatherData:self.cityID];
//    if (![self.cityArray containsObject:self.cityName]) {
//        [self.cityArray addObject:self.cityName];
//        
//     }

//    [self.cityArray removeObject:self.deleteCityName];
//    [[NSUserDefaults standardUserDefaults] setObject:self.cityArray forKey:@"cityArray"];
//    NSLog(@"-----------------------%@",self.cityArray);
//    if (![self.cityIDrray containsObject:self.cityID]) {
//        [self.cityIDrray addObject:self.cityID];
//        [[NSUserDefaults standardUserDefaults] setObject:self.cityIDrray forKey:@"cityIDArray"];
//
//    }
    

    
   
    
    self.pageControl.numberOfPages = self.cityArray.count;
    NSLog(@"======%ld========%ld",self.cityArray.count,self.cityIDrray.count);
    [self createScrollView];
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBarHidden = YES;
    NSMutableArray *array1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityArray"];
    self.cityArray = [NSMutableArray arrayWithArray:array1];
    NSMutableArray *array2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityIDArray"];
    self.cityIDrray = [NSMutableArray arrayWithArray:array2];
    
    self.imageViewArray = [NSMutableArray array];
    

    [self createView];
}
- (void)createView {
    self.manager = [[HttpManager alloc]init];
    self.manager.delegate = self;
    
    self.bigScrollView.delegate = self;
    self.smallScrollView.delegate = self;
    
}

- (void)createScrollView {
    
    for (UIView *view in self.bigScrollView.subviews) {
        [view removeFromSuperview];
    }
    for (UIView *view in self.smallScrollView.subviews) {
        [view removeFromSuperview];
    }
    for (int i = 0; i<self.cityArray.count; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.bigScrollView.bounds.size.width*i, 0, self.bigScrollView.bounds.size.width, self.bigScrollView.bounds.size.height)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = self.cityArray[i];
        label.textColor = [UIColor whiteColor];
        [self.bigScrollView addSubview:label];
        [label release];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.smallScrollView.bounds.size.width*i, 0, self.smallScrollView.bounds.size.width, self.smallScrollView.bounds.size.height)];
       // NSLog(@"%@",NSStringFromCGRect(imageView.frame));
        imageView.tag = i+10;
        imageView.image = [UIImage imageNamed:@"FiveDay.jpg"];
        for (int i = 0; i<5; i++) {
            UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(414/5.0*i, 10, 414/5.0, 40)];
            dateLabel.tag = 100+i;
           // dateLabel.backgroundColor = [UIColor redColor];
            dateLabel.textAlignment = NSTextAlignmentCenter;
            UIImageView *condImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15+414/5.0*i, 60, 50, 50)];
            condImageView.tag = 200+i;
            UILabel *tmpLabel = [[UILabel alloc]initWithFrame:CGRectMake(414/5.0*i, 120, 414/5.0, 40)];
            tmpLabel.tag = 300+i;
            tmpLabel.textAlignment = NSTextAlignmentCenter;
           // tmpLabel.backgroundColor = [UIColor blueColor];
            [imageView addSubview:dateLabel];
            [imageView addSubview:condImageView];
            [imageView addSubview:tmpLabel];
            
           
        }
        
        
        
        [self.imageViewArray addObject:imageView];
        [self.smallScrollView addSubview:imageView];
        
    }
    self.bigScrollView.contentSize = CGSizeMake(self.bigScrollView.bounds.size.width*self.cityArray.count, 0);
    self.bigScrollView.bounces = NO;
    self.bigScrollView.pagingEnabled = YES;
    self.bigScrollView.showsVerticalScrollIndicator = NO;
    self.bigScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.contentSize = CGSizeMake(self.smallScrollView.bounds.size.width*self.cityArray.count, 0);
    self.smallScrollView.bounces = NO;
    self.smallScrollView.pagingEnabled = YES;
    self.smallScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.showsVerticalScrollIndicator = NO;
    
    
    
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag==1) {
        self.smallScrollView.contentOffset = CGPointMake(self.bigScrollView.contentOffset.x/self.bigScrollView.bounds.size.width*self.smallScrollView.bounds.size.width, 0);

    }else{
        self.bigScrollView.contentOffset = CGPointMake(self.smallScrollView.contentOffset.x/self.smallScrollView.bounds.size.width*self.bigScrollView.bounds.size.width, 0);

    }
    int index = (int)scrollView.contentOffset.x/scrollView.bounds.size.width;
    NSString *cityID = self.cityIDrray[index];
    NSLog(@"==========>>>>>>%@",cityID);
    [self.manager getCityWeatherData:cityID];
    float page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    [UIView animateWithDuration:1 animations:^{
    self.pageControl.currentPage = (int)page;
    }];
   // NSLog(@"%d",(int)page);
}
- (IBAction)exitButtonClick:(UIButton *)sender {
    exit(0);
}

- (IBAction)airQualityButtonClick:(UIButton *)sender {
    
    AirQualityViewController *vc = [AirQualityViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
    
    }
- (IBAction)addCityButtonClick:(UIButton *)sender {
    CityManagerVC *vc= [CityManagerVC new];
    vc.view.backgroundColor = [UIColor yellowColor];
    vc.dataArray = self.cityArray;
    [vc.tableView reloadData];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
}

// 获取城市天气的代理方法
- (void)getWeatherDataFail {
    NSLog(@"999999999999999");
}
- (void)getWeatherDataFinish:(StatusModel *)obj with:(NSArray *)array {
    DailyModel *model = array[0];
    self.dataArray = [NSMutableArray arrayWithArray:array];
    self.degreeLabel.text = [NSString stringWithFormat:@"%@°",obj.nowObj.tmp];
    self.weatherLabel.text = [NSString stringWithFormat:@"%@%@°~%@°",obj.nowObj.condObj.txt,model.tmpObj.min,model.tmpObj.max];
    
   // NSLog(@"----------%@",self.dataArray);
   [self giveValuesForSubviewsOfImageViewByDailyModel:self.dataArray];
    
}
- (void)giveValuesForSubviewsOfImageViewByDailyModel:(NSMutableArray *)array{
    int index = (int)self.smallScrollView.contentOffset.x/self.smallScrollView.bounds.size.width;
    //NSLog(@"==========%d",index);
    UIImageView *imageView = [self.smallScrollView viewWithTag:index+10];
   // NSLog(@"%@",NSStringFromCGRect(imageView.frame));

    for (int i = 0; i<5; i++) {
        DailyModel *obj = array[i+1];
               UILabel *dateLabel = [imageView viewWithTag:100+i];
        if (i==0) {
            dateLabel.text = @"明天";
        }else {
            dateLabel.text = [self getWeekBy:obj.date];
        }
        
        
        UIImageView *condImageView = [imageView viewWithTag:200+i];
        [condImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://files.heweather.com/cond_icon/%@.png",obj.condObj.cond_d]]];
       // NSLog(@"==============%@",obj.condObj.cond_d);
        UILabel *tmpLabel = [imageView viewWithTag:300+i];
        tmpLabel.text = [NSString stringWithFormat:@"%@°/%@°",obj.tmpObj.max,obj.tmpObj.min];
        
    }
    
    
}
- (NSString *)getWeekBy:(NSString *)str {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    [formatter setWeekdaySymbols:@[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"]];
    NSDate *date = [formatter dateFromString:str];
    [formatter setDateFormat:@"yyyy-MM-dd eeee"];
    NSString *dateStr = [formatter stringFromDate:date];
    NSString *weekStr = [[dateStr componentsSeparatedByString:@" "] lastObject];
    return weekStr;
}




//- (void)giveValiesForSubviewsOfImageViewByDailyModel:(NSMutableArray *)array {
//    NSInteger index = self.smallScrollView.contentOffset.x/self.smallScrollView.bounds.size.width;
//    UIImageView *imageView = [self.smallScrollView viewWithTag:index+1];
//    for (int i = 0; i<5; i++) {
//        DailyModel *obj = array[i+1];
//        UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(414/5.0*i, 10, 414/5.0, 40)];
//        dateLabel.backgroundColor = [UIColor redColor];
//        dateLabel.textAlignment = NSTextAlignmentCenter;
//        dateLabel.text = obj.date;
//        UIImageView *condImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15+414/5.0*i, 60, 50, 50)];
//        [condImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://files.heweather.com/cond_icon/%@.png",obj.condObj.cond_d]]];
//        UILabel *tmpLabel = [[UILabel alloc]initWithFrame:CGRectMake(414/5.0*i, 120, 414/5.0, 40)];
//        tmpLabel.textAlignment = NSTextAlignmentCenter;
//        tmpLabel.backgroundColor = [UIColor blueColor];
//        tmpLabel.text = [NSString stringWithFormat:@"%@/%@",obj.tmpObj.max,obj.tmpObj.min];
//        [imageView addSubview:dateLabel];
//        [imageView addSubview:condImageView];
//        [imageView addSubview:tmpLabel];
//        
//        NSLog(@"---%@---%@---%@---%@---",obj.date,obj.condObj.cond_d,obj.tmpObj.max,obj.tmpObj.min);
//    }
//    
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    //[_cityArray release];
    [_cityID release];
    [_cityName release];
    [_obj release];
    [_bigScrollView release];
    [_smallScrollView release];
    [_pageControl release];
    [_degreeLabel release];
    [_weatherLabel release];
    [super dealloc];
}
@end
