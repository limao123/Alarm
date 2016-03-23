//
//  LoginViewController.m
//  ProgrammerMeeting
//
//  Created by limao on 15/8/6.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "NSString+check.h"
#import "SVProgressHUD.h"
#import "UINavigationBar+BackgroundColor.h"
#import "UIColor+WNXColor.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
@property (weak, nonatomic) IBOutlet UIButton *qqLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *weixinLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *weiboLoginBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeight;

@end

@implementation LoginViewController

- (IBAction)cancelBtn:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

# pragma makr - 视图生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lineHeight.constant = 0.5f;
    [self.view layoutSubviews];
//    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithHexString:@"3fb0fc" alpha:0.96]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self adjustBtn];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}





- (void)adjustBtn{
    [self centerBtnImageAndTitle:self.qqLoginBtn constant:4];
    [self centerBtnImageAndTitle:self.weixinLoginBtn constant:4];
    [self centerBtnImageAndTitle:self.weiboLoginBtn constant:4];
}


/**
 *  将按钮的图片放在标题上面并居中，constant表示图片与标题的距离
 *
 *  @param btn      要修改的按钮
 *  @param constant 图片与标题的距离
 */
- (void)centerBtnImageAndTitle:(UIButton *)btn constant:(CGFloat)constant{
    CGFloat imageWidth = CGRectGetWidth(btn.imageView.frame);
    CGFloat imageHeight = CGRectGetHeight(btn.imageView.frame);
    CGFloat titleWidth = CGRectGetWidth(btn.titleLabel.frame);
    CGFloat titleHeight = CGRectGetHeight(btn.titleLabel.frame);
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(-titleHeight/2, titleWidth/2, titleHeight/2, -titleWidth/2);
    btn.titleEdgeInsets = UIEdgeInsetsMake(imageHeight/2+constant, -imageWidth/2, -imageHeight/2-constant, +imageWidth/2);
}


# pragma mark - 按钮逻辑

/**
 *  注册跳转
 *
 *  @param sender <#sender description#>
 */
- (void)registerBtn:(UIBarButtonItem *)sender{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginRegister" bundle:nil];
//    RegisterViewController *registerViewController = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
//    [self.navigationController pushViewController:registerViewController animated:NO];
    
//    [self performSegueWithIdentifier:@"toRegisterVC" sender:nil];

}

- (IBAction)loginBtn:(id)sender {
    //检查账号密码合法性
    if ([NSString isStrEmptyOrNull:self.accountTf.text]) {
        [SVProgressHUD showErrorWithStatus:@"账号不能为空"];
        return;
    }
    
    if (![self.passwordTf.text isPasswordLegal]) {
        [SVProgressHUD showErrorWithStatus:@"密码不能为空且长度为6~20"];
        return;
    }
    
    [SVProgressHUD showWithStatus:@"登录中"];
    [AVUser logInWithMobilePhoneNumberInBackground:self.accountTf.text password:self.passwordTf.text block:^(AVUser *user, NSError *error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:error.description];
        } else {
            [SVProgressHUD dismiss];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
    }];    
}

//更新类型 位置 token等
//-(void)updateUserInfo:(BmobUser *)user{

//    [user setObject:@"ios" forKey:@"deviceType"];
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"selfDeviceToken"]) {
//        NSData *data         = [[NSUserDefaults standardUserDefaults] objectForKey:@"selfDeviceToken"];
//        NSString *dataString = [NSString stringWithFormat:@"%@",data];
//        dataString           = [dataString stringByReplacingOccurrencesOfString:@"<" withString:@""];
//        dataString           = [dataString stringByReplacingOccurrencesOfString:@">" withString:@""];
//        dataString           = [dataString stringByReplacingOccurrencesOfString:@" " withString:@""];
//        [user setObject:dataString forKey:@"installId"];
//    }
//    
//    //更新定位
//    [user updateInBackground];
//    
//    BmobDB *db = [BmobDB currentDatabase];
//    [db createDataBase];
//}


- (IBAction)forgetPasswordBtn:(id)sender {
}


- (IBAction)qqLoginBtn:(id)sender {
//    [BmobUser logout];
//    [self thirdPartyLoginWithPlatformName:UMShareToQQ andPlatformID:BmobSNSPlatformQQ];
}

- (IBAction)weixinLoginBtn:(id)sender {
//    [BmobUser logout];
//    [self thirdPartyLoginWithPlatformName:UMShareToWechatSession andPlatformID:BmobSNSPlatformWeiXin];
}

- (IBAction)weiboLoginBtn:(id)sender {
//    [BmobUser logout];
//    [self thirdPartyLoginWithPlatformName:UMShareToSina andPlatformID:BmobSNSPlatformSinaWeibo];
}



//- (void)thirdPartyLoginWithPlatformName:(NSString *)platform andPlatformID:(BmobSNSPlatform)platformID{

//    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:platform];
//    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
//       
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            
//
//            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:platform];
//            NSDictionary *dic = @{@"access_token":snsAccount.accessToken,@"uid":snsAccount.usid,@"expirationDate":snsAccount.expirationDate};
//            
//
//            [SVProgressHUD show];
//            [BmobUser loginInBackgroundWithAuthorDictionary:dic platform:platformID block:^(BmobUser *bmobUser, NSError *error) {
//                if (error) {
//                    [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error.description]];
//                } else if (bmobUser){
//
//                    //跳转
//                    [self updateUserInfo:bmobUser];
//                    [BlackListDBUtil downloadBlackListFromServer:nil];
//                    
//                    //得到的数据在回调Block对象形参respone的data属性
//                   
//                    [[UMSocialDataService defaultDataService] requestSnsInformation:platform completion:^(UMSocialResponseEntity *response){
//                        NSLog(@"SnsInformation is %@",response.data);
//                        
//                        User *user1 = [User sharedUserManagerInstance];
//                        
//                        if ([NSString isStrEmptyOrNull:user1.descr]) {
//                            //新用户
//                            user1.username = response.data[@"screen_name"];
//                            [user1 sub_updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//                                
//                            }];
//                            
//                            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:response.data[@"profile_image_url"]]];
//                            [BmobProFile uploadFileWithFilename:@"avatar.jpg" fileData:data block:^(BOOL isSuccessful, NSError *error, NSString *filename, NSString *url, BmobFile *file) {
//                                if (error) {
//                                    NSLog(@"%@",error);
//                                } else {
//                                    user1.avatorFile = file;
//                                    user1.avatar = file.url;
//                                    [user1 sub_updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//                                        NSLog(@"%@",error.description);
//                                    }];
//                                }
//                                [SVProgressHUD dismiss];
//                                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"User" bundle:nil];
//                                PersonalMsgSettingOneViewController *vc = [sb instantiateViewControllerWithIdentifier:@"PersonalMsgSettingOneViewController"];
//                                vc.isRegister = YES;
//                                [self.navigationController pushViewController:vc animated:YES];
//                            } progress:^(CGFloat progress) {
//                                
//                            }];
//
//                        } else {
//                            [self dismissViewControllerAnimated:YES completion:nil];
//                            [[NSNotificationCenter defaultCenter] postNotificationName:@"Login" object:nil];
//                            [SVProgressHUD dismiss];
//                        }
//
//                    }];
//                    
//                }
//            }];
//        }});

//}

//+ (BOOL)isFirstLoginWithPlatformID:(BmobSNSPlatform)latformID andUserID{

//}
- (IBAction)backgroundTap:(id)sender {
    [self.accountTf resignFirstResponder];
    [self.passwordTf resignFirstResponder];
}


@end
