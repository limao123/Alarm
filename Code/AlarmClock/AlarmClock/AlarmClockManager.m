//
//  AlarmClockManager.m
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "AlarmClockManager.h"

@interface AlarmClockManager ()
@property (strong, nonatomic) NSMutableArray *clocks;

@end

@implementation AlarmClockManager
+ (instancetype)shareAlarmClockManager{
    static AlarmClockManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[AlarmClockManager alloc] init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *path = [self dataFilePath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            NSMutableData *data = [[NSMutableData alloc] initWithContentsOfFile:path];
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            self.clocks = [unarchiver decodeObjectForKey:@"clocks"];
            [unarchiver finishDecoding];
        } else {
            self.clocks = [[NSMutableArray alloc] initWithCapacity:1];
        }
    }
    return self;
}

- (void)addAlarmClock:(AlarmClockEntity *)clock{
    clock.num = self.clocks.count + 1;
    [self.clocks insertObject:clock atIndex:0];
    [self save];
}

- (void)removeAlarmClock:(AlarmClockEntity *)clock{
    [self.clocks removeObject:clock];
    [self save];
}



- (void)save{
    NSString *path = [self dataFilePath];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.clocks forKey:@"clocks"];
    [archiver finishEncoding];
    [data writeToFile:path atomically:YES];


}

- (NSString *)dataFilePath{
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = paths[0];
    return [docPath stringByAppendingPathComponent:@"clock.archive"];
}


@end
