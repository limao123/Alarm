//
//  FindPasswordViewController.m
//  ProgrammerMeeting
//
//  Created by limao on 15/8/6.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import "FindPasswordViewController.h"
#import "NSString+check.h"
#import "PublicView.h"

@interface FindPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobilePhoneTf;
@property (weak, nonatomic) IBOutlet UITextField *smsCodeTf;
@property (weak, nonatomic) IBOutlet UIButton *getSmsCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *aNewPasswordTf;
@property (weak, nonatomic) IBOutlet UITextField *verifyPasswordTf;
@end

@implementation FindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return NO;
}

- (IBAction)getSmsBtnClicked:(UIButton *)sender {
    if ([NSString isStrEmptyOrNull:self.mobilePhoneTf.text]) {
        [SVProgressHUD showErrorWithStatus:@"手机号不能为空"];
        return;
    }
    
    [AVUser requestPasswordResetWithPhoneNumber:self.mobilePhoneTf.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [PublicView startTime:self.getSmsCodeBtn timeSec:60];
        } else {
            [SVProgressHUD showErrorWithStatus:error.description];
        }
    }];

}


- (IBAction)findPasswordNextBtn:(UIButton *)sender {
    if ([NSString isStrEmptyOrNull:self.mobilePhoneTf.text]) {
        [SVProgressHUD showErrorWithStatus:@"手机号不能为空"];
        return;
    }
    
    if ([NSString isStrEmptyOrNull:self.smsCodeTf.text]) {
        [SVProgressHUD showErrorWithStatus:@"验证码不能为空"];
        return;
    }
    
    if (![self.aNewPasswordTf.text isPasswordLegal]) {
        [SVProgressHUD showErrorWithStatus:@"密码不能为空且长度为6~20位"];
        return;
    }
    
    if (![self.aNewPasswordTf.text isEqualToString:self.verifyPasswordTf.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次输入的密码不一致"];
        return;
    }
    
    [AVUser resetPasswordWithSmsCode:self.smsCodeTf.text newPassword:self.aNewPasswordTf.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [SVProgressHUD showSuccessWithStatus:@"密码重置成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else {
            [SVProgressHUD showErrorWithStatus:error.description];
        }
    }];
    
}

- (IBAction)backgroundTap:(id)sender {
    [self.mobilePhoneTf resignFirstResponder];
    [self.smsCodeTf resignFirstResponder];
    [self.aNewPasswordTf resignFirstResponder];
    [self.verifyPasswordTf resignFirstResponder];
}

@end
