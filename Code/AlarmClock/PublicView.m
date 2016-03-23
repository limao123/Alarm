//
//  PublicView.m
//  ProgrammerMeeting
//
//  Created by limao on 15/8/24.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import "PublicView.h"
#import "UIColor+WNXColor.h"
#import "LoginViewController.h"

@implementation PublicView
+ (void)addBarButtonForViewController:(UIViewController *)vc andAction:(SEL)action{
    CGRect returnBtnFrame = CGRectMake(0, 0, 44, 44);
    UIButton *returnBtn = [[UIButton alloc] initWithFrame:returnBtnFrame];
    [returnBtn setImage:[UIImage imageNamed:@"nav_back_nor"] forState:UIControlStateNormal];
    [returnBtn setImage:[UIImage imageNamed:@"nav_back_select"] forState:UIControlStateHighlighted];
    [returnBtn addTarget:vc action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    returnBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
}

+ (UIButton *)getReturnBtn{
    CGRect returnBtnFrame = CGRectMake(0, 0, 44, 44);
    UIButton *returnBtn = [[UIButton alloc] initWithFrame:returnBtnFrame];
    [returnBtn setImage:[UIImage imageNamed:@"nav_back_nor"] forState:UIControlStateNormal];
    [returnBtn setImage:[UIImage imageNamed:@"nav_back_select"] forState:UIControlStateHighlighted];
    returnBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    return returnBtn;
}

+ (UIButton *)buttonWithTitile:(NSString *)title width:(CGFloat)width{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, width, 44);
    [[button titleLabel] setFont:[UIFont systemFontOfSize:14]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    return button;
}

//按钮倒计时
+(void)startTime:(UIButton *)button timeSec:(NSInteger)timeS{
    __block NSInteger timeout= timeS; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [button setTitle:@"获取验证码" forState:UIControlStateNormal];
                button.backgroundColor = [UIColor colorWithHexString:@"3fb0fc" alpha:1];
                button.userInteractionEnabled = YES;
            });
        }else{
            //倒计时显示
            NSInteger seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%ld", (long)seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
                [button setTitle:[NSString stringWithFormat:@"重新获取(%@s)",strTime] forState:UIControlStateNormal];
                button.backgroundColor = [UIColor colorWithHexString:@"c8c8c8" alpha:1];
                button.userInteractionEnabled = NO;
                
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


@end
