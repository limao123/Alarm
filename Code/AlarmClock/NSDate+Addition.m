//
//  NSDate+Addition.m
//  AlarmClock
//
//  Created by 林涛 on 16/3/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate(Addition)

+ (NSString *)getStringForDate:(NSDate *)date format:(NSString *)formatString{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:formatString];
    NSString *fixString = [dateFormatter stringFromDate:date];
    return fixString;
}
@end
