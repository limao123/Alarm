//
//  AlarmClockViewControllerCell.m
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "AlarmClockViewControllerCell.h"
#import "NSDate+Addition.h"



@implementation AlarmClockViewControllerCell
- (void)setDisplayView:(AlarmClockEntity *)entity{
    self.timeLable.text = [NSDate getStringForDate:entity.fireDate format:@"HH:mm"];
    self.tagMessageLabel.text = entity.tagMessage;
    self.openSwitch.on = entity.isOpen;
}
@end
