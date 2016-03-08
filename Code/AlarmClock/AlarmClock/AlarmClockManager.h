//
//  AlarmClockManager.h
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlarmClockEntity.h"

@interface AlarmClockManager : NSObject

- (NSArray *)alarmClocks;
- (void)addAlarmClock:(AlarmClockEntity *)clock;
- (void)removeAlarmClock:(AlarmClockEntity *)clock;
+ (instancetype)shareAlarmClockManager;

@end
