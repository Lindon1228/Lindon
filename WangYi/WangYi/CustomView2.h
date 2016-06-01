//
//  CustomView2.h
//  WangYi
//
//  Created by Lindon on 16/3/12.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@protocol CustomView2Delegate;
@interface CustomView2 : UIView
- (id)initWith:(NSMutableArray *)array;
@property (assign,nonatomic) id<CustomView2Delegate> delegate;


@end

@protocol CustomView2Delegate <NSObject>
@optional
- (void)changeArrayCount:(UIButton *)button;

@end