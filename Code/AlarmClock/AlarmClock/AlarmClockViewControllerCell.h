//
//  AlarmClockViewControllerCell.h
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AlarmClockEntity.h"

@interface AlarmClockViewControllerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@property (weak, nonatomic) IBOutlet UILabel *tagMessageLabel;
@property (weak, nonatomic) IBOutlet UISwitch *openSwitch;
@property (strong, nonatomic) AlarmClockEntity *entity;

@end
