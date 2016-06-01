//
//  CustomView1.h
//  WangYi
//
//  Created by Lindon on 16/3/11.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomView1Delegate;
@interface CustomView1 : UIView

- (id)initWith:(NSMutableArray *)array;
@property (assign,nonatomic) id<CustomView1Delegate> delegate;

@end
@protocol CustomView1Delegate <NSObject>
@optional
- (void)gotoView:(UIButton *)sender;

@end