//
//  AlarmNotificationManager.m
//  AlarmClock
//
//  Created by bmob on 16/3/9.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "AlarmNotificationManager.h"
#import "NSDate+Addition.h"

@implementation AlarmNotificationManager

+ (void)addLocalAlarm:(AlarmClockEntity *)entity{
    [self removeAlarm:entity];
    
    if (entity.repeatDaysInWeek.count <= 0) {
        //无重复
        UILocalNotification *notification=[[UILocalNotification alloc]init];
        NSDate *now = [NSDate date];
        if ([entity.fireDate compare:now] == NSOrderedDescending) {
            //设置调用时间
            notification.fireDate=entity.fireDate;
        } else {
            //已经过了当天时间，需要在第二天通知
            notification.fireDate = [entity.fireDate dateByAddingTimeInterval:DaySumSecond];
        }
        //设置通知属性
        notification.repeatInterval = 0;
        notification.alertBody= entity.tagMessage;
        notification.alertAction=@"关闭闹钟";
        notification.alertLaunchImage=@"Default";
        notification.soundName= [entity.soundPath lastPathComponent];
        notification.userInfo=@{@"app":@"alarmClock",@"num":@(entity.num)};
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    } else {
        //有重复
        NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSWeekdayCalendarUnit fromDate:entity.fireDate];
        int weekdayInt = [[self class] getChinaWeekDay:[componets weekday]];
        for (NSNumber *day in entity.repeatDaysInWeek) {
            UILocalNotification *notification=[[UILocalNotification alloc]init];
            NSDate *now = [NSDate date];
            //表示需要响的时间
            NSInteger dayInt = [day integerValue];
            if ( dayInt > weekdayInt) {
                notification.fireDate = [entity.fireDate dateByAddingTimeInterval:(dayInt-weekdayInt)*DaySumSecond];
                
            } else if(dayInt < weekdayInt){
                notification.fireDate = [entity.fireDate dateByAddingTimeInterval:(dayInt + 7 - weekdayInt)*DaySumSecond];

            } else {
                NSDate *now = [NSDate date];
                if ([entity.fireDate compare:now] == NSOrderedDescending) {
                    //设置调用时间
                    notification.fireDate=entity.fireDate;
                } else {
                    //已经过了当天时间，需要在第二天通知
                    notification.fireDate = [entity.fireDate dateByAddingTimeInterval:7*DaySumSecond];
                }
            }
            
            //设置通知属性
            notification.repeatInterval = NSWeekCalendarUnit;
            notification.alertBody= entity.tagMessage;
            notification.alertAction=@"关闭闹钟";
            notification.alertLaunchImage=@"Default";
            notification.soundName= [entity.soundPath lastPathComponent];
            notification.userInfo=@{@"app":@"alarmClock",@"num":@(entity.num)};
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }
    }
}

+ (int)getChinaWeekDay:(int)day{
    if (day == 1) {
        return 6;
    } else {
        return day-2;
    }
}


+ (void)removeAlarm:(AlarmClockEntity *)entity{
    //拿到存有所有推送的数组
    NSArray * array = [[UIApplication sharedApplication] scheduledLocalNotifications];
    //便利这个数组根据 key 拿到我们想要的UILocalNotification
    for (UILocalNotification * loc in array) {
        if ([[loc.userInfo objectForKey:@"app"] isEqualToString:@"alarmClock"] &&
            [[loc.userInfo objectForKey:@"num"] integerValue] == entity.num) {
            //取消本地推送
            [[UIApplication sharedApplication] cancelLocalNotification:loc];
        }
    }
}

//更新闹钟
+ (void)updateAlarm:(AlarmClockEntity *)entity{
    [[self class] removeAlarm:entity];
    [[self class] addLocalAlarm:entity];
}

+ (void)showNotificaion{
    NSArray * array = [[UIApplication sharedApplication] scheduledLocalNotifications];
    //声明本地通知对象
    for (UILocalNotification *noti in array) {
        if ([[noti.userInfo objectForKey:@"app"] isEqualToString:@"alarmClock"]) {
            NSLog(@"%@",noti);
        }
    }
}
@end
