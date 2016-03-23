//
//  PublicView.h
//  ProgrammerMeeting
//
//  Created by limao on 15/8/24.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicView : NSObject
+ (void)addBarButtonForViewController:(UIViewController *)vc andAction:(SEL)action;
+(void)startTime:(UIButton *)button timeSec:(NSInteger)timeS;

/**
 *  返回一个自定义返回按钮
 *
 *  @return 一个自定义返回按钮
 */
+ (UIButton *)getReturnBtn;

+ (UIButton *)buttonWithTitile:(NSString *)title width:(CGFloat)width;


@end
