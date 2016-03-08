//
//  FileUtil.m
//  AlarmClock
//
//  Created by 林涛 on 16/3/7.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil
+ (NSString *)getFileNameFromPath:(NSString *)path{
    NSString *fileName = [[[path lastPathComponent] componentsSeparatedByString:@"."] firstObject];
    return fileName;
}
@end
