//
//  ViewController.h
//  WangYi
//
//  Created by Lindon on 16/3/10.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIScrollView *smallScrollView;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UIScrollView *bigScrollView;
@property (retain,nonatomic) NSMutableArray *allButtonArray;
//@property (retain,nonatomic) NSMutableArray *buttonArray;
@property (retain,nonatomic) NSMutableArray *dataArray;
@end

