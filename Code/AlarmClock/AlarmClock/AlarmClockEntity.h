//
//  AlarmClockEntity.h
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmClockEntity : NSObject<NSCoding>
@property (unsafe_unretained, nonatomic) NSInteger num;
@property (copy, nonatomic) NSDate *fireDate ; //格式hh:MM
@property (copy, nonatomic) NSArray *repeatDaysInWeek;
@property (copy, nonatomic) NSString *tagMessage;
@property (copy, nonatomic) NSString *soundPath;
@property (unsafe_unretained, nonatomic) BOOL isLaterRepeat;
@property (unsafe_unretained, nonatomic) BOOL isOpen;
- (void)changeUUID;
@end
