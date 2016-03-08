//
//  RepeatSelectViewController.h
//  AlarmClock
//
//  Created by 林涛 on 16/3/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RepeatSelectBlock)(NSArray *selectedDays);

@interface RepeatSelectViewController : UIViewController
@property (copy, nonatomic) NSArray *repeatDaysInWeek;
@property (copy, nonatomic) RepeatSelectBlock block;
+ (NSArray *)weeksList;
@end
