//
//  TagEditViewController.h
//  AlarmClock
//
//  Created by 林涛 on 16/3/2.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TagEditBlock)(NSString *tag);

@interface TagEditViewController : UIViewController
@property (copy, nonatomic) TagEditBlock block;
@property (copy, nonatomic) NSString *tag;
@end
