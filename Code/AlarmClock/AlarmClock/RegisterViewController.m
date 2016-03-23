//
//  RegisterViewController.m
//  ProgrammerMeeting
//
//  Created by limao on 15/8/6.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIColor+WNXColor.h"
#import "NSString+check.h"



@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - 按钮监听

- (IBAction)registerBtnClicked:(UIButton *)sender {
    if ([NSString isStrEmptyOrNull:self.phoneNumTf.text]) {
        [SVProgressHUD showInfoWithStatus:@"手机号不能为空"];
        return;
    }

    if ([NSString isStrEmptyOrNull:self.passwordTf.text] ||
        self.passwordTf.text.length < 6 ||
        self.passwordTf.text.length > 12) {
        [SVProgressHUD showInfoWithStatus:@"请输入6~20位用户密码"];
        return;
    }
    
    AVUser *user = [AVUser user];
    user.username = self.phoneNumTf.text;
    user.password =  self.passwordTf.text;
    user.mobilePhoneNumber = self.phoneNumTf.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:error.description];
        } else {
            [self performSegueWithIdentifier:@"smsCode" sender:nil];
        }
    }];
 
    
}

- (IBAction)serviceContractBtnClicked:(UIButton *)sender {
    
}

+ (void)jumpToMsgSetting:(BOOL)isReigster{

}

- (IBAction)backgroundTap:(id)sender {
    [self.phoneNumTf resignFirstResponder];
    [self.passwordTf resignFirstResponder];
}

//- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
//    if (identifier isEqualToString:@"smsCode") {
//        sender
//    }
//}

@end
