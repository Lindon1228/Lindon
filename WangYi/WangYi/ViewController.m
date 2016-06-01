//
//  ViewController.m
//  WangYi
//
//  Created by Lindon on 16/3/10.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "ViewController.h"
#import "CustomView1.h"
#import "CustomView2.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,CustomView2Delegate,CustomView1Delegate> {
    UIImageView *_imageView;
    BOOL   selected;
    NSMutableArray *_headerArray;
    UIView *_view;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.allButtonArray = @[
                            @[@"头条",@"娱乐",@"热点",@"体育",@"开封",@"订阅",@"财经",@"科技",@"图片",@"跟帖",@"直播",@"时尚",@"轻松",@"轻松一刻",@"汽车"].mutableCopy,
                            
                            @[@"段子",@"军事",@"房产",@"历史",@"家居",@"原创",@"健康",@"游戏",@"政务",@"漫画"].mutableCopy
                            
                            ].mutableCopy;

    
    [self createView];
    [self createTableView];
}
- (void)createTableView {

    UITableView *tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 414, 610) style:UITableViewStylePlain] autorelease];
    //tableView.backgroundColor = [UIColor yellowColor];
    tableView.tag = 1000;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.hidden = YES;
    [self.view addSubview:tableView];
    
}




- (void)createView {
    

    

    _headerArray = @[@"切换栏目",@"点击添加更多栏目"].mutableCopy;
    self.dataArray = [NSMutableArray array];
    
    
    
    
   
    
    for (int i = 0; i<[self.allButtonArray[0] count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(80*i, 0, 80, 40);
        //button.backgroundColor = [UIColor redColor];
        [button setTitle:self.allButtonArray[0][i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.dataArray addObject:button];
        [self.smallScrollView addSubview:button];
        UITableView *tableView = [[[UITableView alloc]initWithFrame:CGRectMake(self.bigScrollView.bounds.size.width*i, 0, self.bigScrollView.bounds.size.width, self.bigScrollView.bounds.size.height) style:UITableViewStylePlain] autorelease];
        tableView.tag = i+1;
        tableView.dataSource = self;
        tableView.delegate = self;
        [self.bigScrollView addSubview:tableView];
     
        
    
    }
    _imageView = [[[UIImageView alloc]init] autorelease];
    _imageView.backgroundColor = [UIColor redColor];
    _imageView.frame = CGRectMake(20, 38, 40, 2);
    [self.smallScrollView addSubview:_imageView];
    self.smallScrollView.contentSize = CGSizeMake(80*[self.allButtonArray[0] count], 0);
    //self.smallScrollView.pagingEnabled = YES;
    self.smallScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.bounces = NO;
    self.bigScrollView.contentSize = CGSizeMake(self.bigScrollView.bounds.size.width*[self.allButtonArray[0] count], 0);
    self.bigScrollView.showsHorizontalScrollIndicator = NO;
    self.bigScrollView.pagingEnabled = YES;
    self.bigScrollView.delegate = self;
    self.bigScrollView.bounces = NO;
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [UIView animateWithDuration:1 animations:^{
        if (scrollView.contentOffset.x<=200) {
            _imageView.frame = CGRectMake(20+scrollView.contentOffset.x/10, 38, 40, 2);
        }else if (scrollView.contentOffset.x<=0){
            
            
        }else if (scrollView.contentOffset.x<=414*([self.allButtonArray[0] count]-5)){
            _imageView.frame = CGRectMake(20+scrollView.              contentOffset.x*80/414.0, 38, 40, 2);
            float X = scrollView.contentOffset.x*80/414.0;
            [self.smallScrollView setContentOffset:CGPointMake(X, 0)];
        }else{
            _imageView.frame = CGRectMake(20+scrollView.              contentOffset.x*80/414.0, 38, 40, 2);
            
        }
        for (int i = 0; i<self.dataArray.count; i++) {
            UIButton *button = self.dataArray[i];
            
            if (button.frame.origin.x == scrollView.              contentOffset.x/414*80 ) {
                NSInteger length = button.currentTitle.length;
                _imageView.bounds = CGRectMake(0, 0, 40*length/2, 2);
                
                
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }else{
                [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                
            }
        }

    }];
   
    
}
- (IBAction)selectButtonTitleButtonClick:(UIButton *)sender {
    selected = !selected;
    UITableView *tableView = [self.view viewWithTag:1000];
   
    [self.view bringSubviewToFront:sender];
    if (selected) {

        tableView.hidden = NO;
        
        
    }else{

        tableView.hidden = YES;
    }
    
    
    
   

   
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1000) {
        
        return 1;
    }
    
    
    
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor cyanColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        
    }
    
    if (tableView.tag==1000) {
        for (UIView *view in cell.subviews) {
            [view removeFromSuperview];
        }

        
        if (indexPath.section==0) {
            cell.backgroundColor = [UIColor cyanColor];
            CustomView1 *view = [[[CustomView1 alloc]initWith:self.allButtonArray[indexPath.section]] autorelease];
            view.delegate = self;
            [cell addSubview:view];
        }else{
            CustomView2 *view =  [[[CustomView2 alloc]initWith:self.allButtonArray[indexPath.section]] autorelease];
            view.delegate = self;
            [cell addSubview:view];
        }
        
    }else{
        
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        
        
    }
    
    
    
    
    
    return cell;
    
}
- (void)gotoView:(UIButton *)sender {
    UITableView *tableView = [self.view viewWithTag:1000];
    tableView.hidden = YES;
    selected = !selected;
    
    if (sender.tag-1>=([self.allButtonArray[0] count]-5)) {
        self.bigScrollView.contentOffset = CGPointMake((sender.tag-1)*414, 0);
        self.smallScrollView.contentOffset = CGPointMake(([self.allButtonArray[0] count]-5)*80, 0);
        _imageView.frame = CGRectMake(20+self.bigScrollView.              contentOffset.x*80/414.0, 38, 40, 2);

    }else {
        self.bigScrollView.contentOffset = CGPointMake((sender.tag-1)*414, 0);
        
        self.smallScrollView.contentOffset = CGPointMake((sender.tag-1)*80, 0);
        _imageView.frame = CGRectMake(20+self.bigScrollView.              contentOffset.x*80/414.0, 38, 40, 2);

    }
    [UIView animateWithDuration:1 animations:^{
        NSInteger length = sender.currentTitle.length;
        _imageView.bounds = CGRectMake(0, 0, 40*length/2, 2);
    }];

    
    }


- (void)changeArrayCount:(UIButton *)button {
    for (UIView *view in self.smallScrollView.subviews) {
        [view removeFromSuperview];
    }
    for (UIView *view in self.bigScrollView.subviews) {
        [view removeFromSuperview];
    }
    
    UITableView *tableView = [self.view viewWithTag:1000];
    
    [self.allButtonArray[0] addObject:button.currentTitle];
    [self.allButtonArray[1] removeObject:button.currentTitle];
    [self createView];
    [tableView reloadData];
   
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView.tag==1000) {
        UILabel *label = [[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 414, 40)] autorelease];
        label.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        label.text = _headerArray[section];
        label.textColor = [UIColor colorWithRed:246/255.0 green:167/255.0 blue:18/255.0 alpha:1];
        return label;

    }
    
    return nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    
    if (tableView.tag==1000) {
        UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 414, 44)];
        footer.backgroundColor = [UIColor clearColor];
        
        return footer;

    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 1000) {
       
        return ([self.allButtonArray[indexPath.section] count]+3)/4*44;
    }
    
    return 44;
}



- (void)buttonClick:(UIButton *)sender {
    
    
    if (self.smallScrollView.contentOffset.x>=80*([self.allButtonArray[0] count]-5)) {
        
        [UIView animateWithDuration:1 animations:^{
            self.bigScrollView.contentOffset = CGPointMake(sender.frame.origin.x/80.0*414, 0);
            _imageView.frame = CGRectMake(20+self.bigScrollView.              contentOffset.x*80/414.0, 38, 40, 2);
        }];
        
        
        
    }else{
        
        [UIView animateWithDuration:1 animations:^{
            self.bigScrollView.contentOffset = CGPointMake(sender.frame.origin.x/80.0*414, 0);
            self.smallScrollView.contentOffset = CGPointMake(sender.frame.origin.x, 0);
            _imageView.frame = CGRectMake(20+self.bigScrollView.              contentOffset.x*80/414.0, 38, 40, 2);
        }];

        
        
    }
    [UIView animateWithDuration:1 animations:^{
        NSInteger length = sender.currentTitle.length;
        _imageView.bounds = CGRectMake(0, 0, 40*length/2, 2);
    }];

    


  }





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_dataArray release];
    [_allButtonArray release];
    [_smallScrollView release];
    [_tableView release];
    [_bigScrollView release];
    [super dealloc];
}
@end
