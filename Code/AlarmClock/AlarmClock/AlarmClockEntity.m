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
        _num = [aDecoder decodeIntegerForKey:@"num"];
        _fireDate = [aDecoder decodeObjectForKey:@"fireDate"];
        _repeatDaysInWeek = [aDecoder decodeObjectForKey:@"repeatDaysInWeek"];
        _tagMessage = [aDecoder decodeObjectForKey:@"tagMessage"];
        _soundPath = [aDecoder decodeObjectForKey:@"soundPath"];
        _isLaterRepeat = [aDecoder decodeBoolForKey:@"isLaterRepeat"];
        _isOpen = [aDecoder decodeBoolForKey:@"isOpen"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:self.num forKey:@"num"];
    [aCoder encodeObject:self.fireDate forKey:@"fireDate"];
    [aCoder encodeObject:self.repeatDaysInWeek forKey:@"repeatDaysInWeek"];
    [aCoder encodeObject:self.tagMessage forKey:@"tagMessage"];
    [aCoder encodeObject:self.soundPath forKey:@"soundPath"];
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

- (NSString *)description{
    return [NSString stringWithFormat:@"fireDate:%@\\n repeatDaysInWeek:%@\\n tagMessage:%@\\n soundPath:%@\\n isLaterRepeat:%@\\n isOpen:%@\\n",self.fireDate,self.repeatDaysInWeek,self.tagMessage,self.soundPath,@(self.isLaterRepeat),@(self.isOpen)];
}
@end
