//
//  AddCityVC.h
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpManager.h"
@interface AddCityVC : UIViewController
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain,nonatomic) NSMutableDictionary *dic;
@property (retain,nonatomic) HttpManager *manager;
@property (retain,nonatomic) NSMutableArray *provArray;
@end
