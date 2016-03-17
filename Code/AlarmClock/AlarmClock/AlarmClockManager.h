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

/**
 *  获取所有闹钟对象
 *
 *  @return 闹钟对象数组
 */
- (NSArray *)alarmClocks;

/**
 *  添加闹钟对象
 *
 *  @param clock 操作的闹钟对象
 */
- (void)addAlarmClock:(AlarmClockEntity *)clock;

/**
 *  移除闹钟对象
 *
 *  @param clock 操作的闹钟对象
 */
- (void)removeAlarmClock:(AlarmClockEntity *)clock;

/**
 *  获取闹钟对象管理单例
 *
 *  @return 闹钟对象管理者
 */
+ (instancetype)shareAlarmClockManager;

/**
 *  持久化闹钟对象
 */
- (void)save;

/**
 *  打印持久化的闹钟对象
 */
- (void)showLocalAlarm;

/**
 *  打印内存中的闹钟对象
 */
- (void)showAlaams;
@end
