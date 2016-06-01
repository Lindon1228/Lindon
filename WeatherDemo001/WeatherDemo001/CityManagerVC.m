//
//  CityManagerVC.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/25.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "CityManagerVC.h"
#import "AddCityVC.h"
#import "CityManagerCell.h"
#import "ViewController.h"
@interface CityManagerVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CityManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"CityManagerCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//    NSLog(@"")
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.cityNameLabel.tag = indexPath.row;
    cell.cityNameLabel.text = self.dataArray[indexPath.row];
    cell.deleteButton.tag = indexPath.row;
    [cell.deleteButton addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
//2123
- (void)deleteButtonClick:(UIButton *)sender {
  
    ViewController *vc = self.navigationController.viewControllers[0];
    vc.offet = (int)vc.bigScrollView.contentOffset.x/vc.bigScrollView.bounds.size.width;
    [vc.cityIDrray removeObjectAtIndex:sender.tag];
    [vc.cityArray removeObject:self.dataArray[sender.tag]];
    [[NSUserDefaults standardUserDefaults] setObject:vc.cityArray forKey:@"cityArray"];
    [[NSUserDefaults standardUserDefaults] objectForKey:@"cityIDrray"];
    
    if (vc.offet >= sender.tag&&vc.offet!=0) {
        vc.offet = vc.offet-1;
        
    }
    vc.bigScrollView.contentOffset = CGPointMake(vc.offet*vc.bigScrollView.bounds.size.width, 0);
    vc.smallScrollView.contentOffset = CGPointMake(vc.offet*vc.smallScrollView.bounds.size.width, 0);
    vc.pageControl.numberOfPages = vc.cityArray.count;
    vc.pageControl.currentPage = vc.offet;

    
        NSLog(@"+++offet+++%d",vc.offet);
    vc.cityID = vc.cityIDrray[vc.offet];
    vc.cityName = vc.cityArray[vc.offet];
    NSLog(@"--------%ld-------%ld",vc.cityArray.count,vc.cityIDrray.count);
    //vc.deleteCityName = cityNameLabel.text;
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60.f;
}


- (IBAction)backButtonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    }
- (IBAction)addButtonClick:(UIButton *)sender {
    AddCityVC *vc = [AddCityVC new];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
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
