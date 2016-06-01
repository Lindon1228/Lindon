//
//  AirQualityViewController.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/29.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "AirQualityViewController.h"

@interface AirQualityViewController ()
@property (nonatomic,retain) CAShapeLayer *shapeLayer;
@end

@implementation AirQualityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 220, 220);
    self.shapeLayer.position = CGPointMake(self.view.center.x, self.view.center.y-60);
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth = 5;
    self.shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 220, 220)];
    self.shapeLayer.path = circlePath.CGPath;
    [self.view.layer addSublayer:self.shapeLayer];
    //self.shapeLayer.strokeStart = 0.25;
    self.shapeLayer.strokeEnd = 0.75;
    
}

- (IBAction)backButtonClcik:(UIButton *)sender {
    
    
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
    [_nameLabel release];
    [_polluteNumberLabel release];
    [_polluteLevelLabel release];
    [_leftLabel release];
    [_rightLabel release];
    [_twLabel release];
    [_gjLabel release];
    [_fsLabel release];
    [_ydLabel release];
    [super dealloc];
}
@end
