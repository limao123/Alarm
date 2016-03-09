//
//  AlarmNotificationManager.m
//  AlarmClock
//
//  Created by bmob on 16/3/9.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "AlarmNotificationManager.h"
 

@implementation AlarmNotificationManager
+ (void)addLocalAlarm:(AlarmClockEntity *)entity{
    //定义本地通知对象
    UILocalNotification *notification=[[UILocalNotification alloc]init];
    //设置调用时间
    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:5.0];//通知触发的时间，10s以后
    notification.repeatInterval=2;//通知重复次数
    
    
    //    NSCalendar *calendar=[NSCalendar currentCalendar];
    //    [calendar setTimeZone:[NSTimeZone defaultTimeZone]];
    //    notification.repeatCalendar=calendar;//当前日历，使用前最好设置时区等信息以便能够自动同步时间
    
    //设置通知属性
    notification.alertBody= entity.tagMessage; //通知主体
    notification.alertAction=@"关闭闹钟"; //待机界面的滑动动作提示
    notification.alertLaunchImage=@"Default";//通过点击通知打开应用时的启动图片,这里使用程序启动图片
    notification.soundName= [entity.soundPath lastPathComponent];//收到通知时播放的声音，默认消息声音
//        notification.soundName=@"sms-received5.wav";//通知声音（需要真机才能听到声音）
    
    //设置用户信息
    notification.userInfo=@{@"id":@1,@"user":@"jredu"};//绑定到通知上的其他附加信息
    
    //调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];

}

+ (void)removeAlarm:(AlarmClockEntity *)entity{
    
}
@end
