//
//  UICustomSwitch.h
//  Wonderful
//
//  Created by limao on 15/10/29.
//  Copyright © 2015年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISwitch (extended)
- (void) setAlternateColors:(BOOL) boolean;//这是文档未记录的特性，显示为橘黄色的背景。
@end

@interface _UISwitchSlider : UIView
@end

@interface UICustomSwitch : UISwitch
- (void) setLeftLabelText: (NSString *) labelText;
- (void) setRightLabelText: (NSString *) labelText;
@end

