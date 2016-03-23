//
//  SmsCodeEnterViewController.m
//  AlarmClock
//
//  Created by bmob-LT on 16/3/23.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "SmsCodeEnterViewController.h"


@interface SmsCodeEnterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *smsCodeTf;

@end

@implementation SmsCodeEnterViewController

- (IBAction)enterBtn:(id)sender {
    if (self.smsCodeTf.text.length <= 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
    } else {
        [AVUser verifyMobilePhone:self.smsCodeTf.text withBlock:^(BOOL succeeded, NSError *error) {
            //验证结果
            if (error) {
                [SVProgressHUD showErrorWithStatus:error.description];
            } else {
                [SVProgressHUD showSuccessWithStatus:@"验证通过，请登录"];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
