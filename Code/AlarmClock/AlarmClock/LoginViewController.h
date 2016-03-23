//
//  LoginViewController.h
//  ProgrammerMeeting
//
//  Created by limao on 15/8/6.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^LoginBlock)(void);

@interface LoginViewController : UIViewController
//@property (nonatomic, retain)TencentOAuth *tencentOAuth;
@property (copy, nonatomic) LoginBlock block;
@end
