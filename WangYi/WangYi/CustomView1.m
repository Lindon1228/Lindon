//
//  CustomView1.m
//  WangYi
//
//  Created by Lindon on 16/3/11.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "CustomView1.h"

@implementation CustomView1

- (id)initWith:(NSMutableArray *)array {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 414, (array.count+3)/4*44);
        [self createUI:array];
    }
    
    return self;
    
}
- (void)createUI:(NSMutableArray *)array {
    
    for (int i = 0; i<array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10+(10+91)*(i%4), 10+(10+24)*(i/4), 91, 24);
        button.layer.cornerRadius = 5;
        button.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        button.tag = i+1;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    
    
}
- (void)buttonClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(gotoView:)]) {
        [self.delegate gotoView:sender];
    }
    
    
    
    
    
   // NSLog(@"--%@",sender.currentTitle);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
