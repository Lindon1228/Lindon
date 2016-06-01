//
//  CityManagerCell.m
//  WeatherDemo001
//
//  Created by Lindon on 16/3/27.
//  Copyright © 2016年 Lindon. All rights reserved.
//

#import "CityManagerCell.h"

@implementation CityManagerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_cityNameLabel release];
    [_deleteButton release];
    [super dealloc];
}
@end
