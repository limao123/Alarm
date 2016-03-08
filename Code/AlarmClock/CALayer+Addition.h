//
//  CALayer+Addition.h
//  ProgrammerMeeting
//
//  Created by limao on 15/8/17.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Addition)

@property(nonatomic, strong) UIColor *borderColorFromUIColor;

- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
