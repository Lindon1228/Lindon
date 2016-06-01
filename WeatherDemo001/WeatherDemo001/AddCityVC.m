//
//  AddCityVC.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "AddCityVC.h"
#import "CityManagerVC.h"
#import "Database.h"
#import "CityModel.h"
#import "ViewController.h"
@interface AddCityVC ()<UITableViewDataSource,UITableViewDelegate,HttpManagerDelegate> {
    
    BOOL  selected[30];
}

@end

@implementation AddCityVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    self.manager = [[HttpManager alloc]init];
//    self.manager.delegate = self;
//    [self.manager getCityData];
//    [self.manager release];

    self.dic = [Database selectDataFromCityTable];
    
   // NSLog(@"========>>%ld",self.dic.allKeys.count);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return (selected[section]?[self.dic[self.dic.allKeys[section]] count]:0);
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dic.allKeys.count;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 414, 28);
    btn.backgroundColor = [UIColor purpleColor];
    btn.tag = section;
    [btn setTitle:self.dic.allKeys[section] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}
- (void)buttonClick:(UIButton *)sender {
    selected[sender.tag] = !selected[sender.tag];
    NSLog(@"234567890");
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationMiddle];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return self.dic.allKeys[section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    CityModel *obj = self.dic[self.dic.allKeys[indexPath.section]][indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = obj.city;
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CityModel *obj = self.dic[self.dic.allKeys[indexPath.section]][indexPath.row];
    
    ViewController *vc = self.navigationController.viewControllers[0];
    [[NSUserDefaults standardUserDefaults] setObject:obj.ID forKey:@"city_id"];
    [[NSUserDefaults standardUserDefaults] setObject:obj.city forKey:@"cityName"];
    vc.cityName = obj.city;
    //[[NSUserDefaults standardUserDefaults] objectForKey:@"cityName"];
    vc.cityID = obj.ID;
        NSLog(@"+++++++++++++>>>>>>>%@",obj.ID);
    //[NSUserDefaults standardUserDefaults] objectForKey:@"city_id"];
    if (!vc.cityName) {
        vc.cityName = @"北京";
        vc.cityID = @"CN101010100";
    }
    
    if (![vc.cityArray containsObject:vc.cityName]) {
        [vc.cityArray addObject:vc.cityName];
        [[NSUserDefaults standardUserDefaults] setObject:vc.cityArray forKey:@"cityArray"];
    }
    if (![vc.cityIDrray containsObject:vc.cityID]) {
        [vc.cityIDrray addObject:vc.cityID];
        [[NSUserDefaults standardUserDefaults] setObject:vc.cityIDrray forKey:@"cityIDArray"];
    }
   // NSLog(@"--------%ld-------%ld",vc.cityArray.count,vc.cityIDrray.count);
    vc.pageControl.numberOfPages = vc.cityArray.count;
    vc.pageControl.currentPage = vc.cityArray.count-1;
//    vc.bigScrollView.contentSize =
    vc.pageControl.currentPage = vc.cityIDrray.count-1;
    vc.bigScrollView.contentOffset = CGPointMake((vc.cityArray.count-1)*vc.bigScrollView.bounds.size.width, 0);
    vc.smallScrollView.contentOffset = CGPointMake((vc.cityIDrray.count-1)*vc.smallScrollView.bounds.size.width, 0);
   
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}






- (void)getCityDataFail {
    
}
- (void)getCityDataFinish:(NSArray *)array {
    
//    self.provArray = [NSMutableArray array];
//    for (int i = 0; i<array.count; i++) {
//        CityModel *obj = array[i];
//        if (![self.provArray containsObject:obj.prov]) {
//            [self.provArray addObject:obj.prov];
//        }
//        
//    }
//    NSLog(@"--====----%@",array);
    [Database insertDataIntoCityTable:array];
    
   // NSLog(@"--====----%ld",self.dic.allKeys.count);

    [self.tableView reloadData];
}


- (IBAction)backButtonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
