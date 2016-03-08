//
//  NSDate+Addition.h
//  AlarmClock
//
//  Created by 林涛 on 16/3/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(Addition)
+ (NSString *)getStringForDate:(NSDate *)date format:(NSString *)formatString;
@end
