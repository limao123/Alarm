//
//  RingSelectViewController.h
//  AlarmClock
//
//  Created by 林涛 on 16/3/7.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RingSelectBlock)(NSString *ringPath);

@interface RingSelectViewController : UIViewController
@property (copy, nonatomic) RingSelectBlock block;
@property (copy, nonatomic) NSString *ringPath;
@end
