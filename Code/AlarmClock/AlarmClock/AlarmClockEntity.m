//
//  AlarmClockEntity.m
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "AlarmClockEntity.h"



@implementation AlarmClockEntity

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.num = [aDecoder decodeIntegerForKey:@"num"];
        self.fireDate = [aDecoder decodeObjectForKey:@"fireDate"];
        self.repeatDaysInWeek = [aDecoder decodeObjectForKey:@"repeatDaysInWeek"];
        self.tagMessage = [aDecoder decodeObjectForKey:@"soundPath"];
        self.isLaterRepeat = [aDecoder decodeBoolForKey:@"isLaterRepeat"];
        self.isOpen = [aDecoder decodeObjectForKey:@"isOpen"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:self.num forKey:@"num"];
    [aCoder encodeObject:self.fireDate forKey:@"fireDate"];
    [aCoder encodeObject:self.repeatDaysInWeek forKey:@"repeatDaysInWeek"];
    [aCoder encodeObject:self.tagMessage forKey:@"soundPath"];
    [aCoder encodeBool:self.isLaterRepeat forKey:@"isLaterRepeat"];
    [aCoder encodeBool:self.isOpen forKey:@"isOpen"];
}

- (BOOL)isEqual:(AlarmClockEntity *)object{
    if (self.num == object.num &&
        [self.fireDate isEqual:object.fireDate] &&
        [self.repeatDaysInWeek isEqual:object.repeatDaysInWeek] &&
        [self.soundPath isEqual:object.soundPath] &&
        self.isLaterRepeat == object.isLaterRepeat &&
        self.isOpen == object.isOpen) {
        return true;
    } else {
        return false;
    }
}
@end
