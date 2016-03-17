//
//  AlarmNotificationManager.h
//  AlarmClock
//
//  Created by bmob on 16/3/9.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlarmClockEntity.h"
#import <UIKit/UIKit.h>

@interface AlarmNotificationManager : NSObject
/**
 *  添加本地推送
 *
 *  @param entity 闹钟对象
 */
+ (void)addLocalAlarm:(AlarmClockEntity *)entity;

/**
 *  删除本地推送
 *
 *  @param entity 闹钟对象
 */
+ (void)removeAlarm:(AlarmClockEntity *)entity;

/**
 *  更新本地推送
 *
 *  @param entity 闹钟对象
 */
+ (void)updateAlarm:(AlarmClockEntity *)entity;

/**
 *  查看本地推送
 */
+ (void)showNotificaion;
@end
