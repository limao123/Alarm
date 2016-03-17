//
//  AlarmClockEditViewController.h
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmClockEntity.h"

@interface AlarmClockEditViewController : UIViewController
@property (strong, nonatomic) AlarmClockEntity *alarmClock;
@property (unsafe_unretained, nonatomic) BOOL isNew; //是否是新闹钟
@end
