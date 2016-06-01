//
//  CityManagerVC.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityManagerVC : UIViewController
@property (retain,nonatomic) NSMutableArray *dataArray;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
