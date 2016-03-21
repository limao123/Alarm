//
//  AlarmClockViewControllerCell.m
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "AlarmClockViewControllerCell.h"
#import "NSDate+Addition.h"
#import "AlarmNotificationManager.h"
#import "AlarmClockManager.h"


@implementation AlarmClockViewControllerCell

- (void)setEntity:(AlarmClockEntity *)entity{
    _entity = entity;
    self.timeLable.text = [NSDate getStringForDate:entity.fireDate format:@"HH:mm"];
    self.tagMessageLabel.text = entity.tagMessage;
    self.openSwitch.on = entity.isOpen;
}

- (IBAction)alarmClockSwicth:(id)sender {
    if(self.openSwitch.isOn == YES){
        [AlarmNotificationManager addLocalAlarm:self.entity];
//        [AlarmNotificationManager showNotificaion];
            self.contentView.backgroundColor = [UIColor whiteColor];

    } else {
        [AlarmNotificationManager removeAlarm:self.entity];
//        [AlarmNotificationManager showNotificaion];
            self.contentView.backgroundColor = [UIColor grayColor];
    }
    self.entity.isOpen = self.openSwitch.isOn;
    [[AlarmClockManager shareAlarmClockManager] save];

//    [[AlarmClockManager shareAlarmClockManager] showAlarms];
}

@end
