//
//  UserInfoViewController.m
//  AlarmClock
//
//  Created by bmob-LT on 16/3/15.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "UserInfoViewController.h"
#import "LoginViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AVUser *user = [AVUser currentUser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginRegister" bundle:nil];
    UINavigationController *login = [storyboard instantiateViewControllerWithIdentifier:@"LoginNC"];
    [self presentViewController:login animated:YES completion:nil];
//    [[RCIM sharedRCIM] connectWithToken:@"UMhNaO8u3RwR4lRjOkVNYuvkWi2RTg0/vhK6EFksmSV6dHRdfBDgyiQcKF/yLtAiD+XayfihlIsNwOro6Jw5Ug==" success:^(NSString *userId) {
//        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
//    } error:^(RCConnectErrorCode status) {
//        NSLog(@"登陆的错误码为:%ld", (long)status);
//    } tokenIncorrect:^{
//        //token过期或者不正确。
//        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
//        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
//        NSLog(@"token错误");
//    }];
}

/**
 *此方法中要提供给融云用户的信息，建议缓存到本地，然后改方法每次从您的缓存返回
 */
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion
{
    //此处为了演示写了一个用户信息
    if ([@"1" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"1";
        user.name = @"测试1";
//        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        
        return completion(user);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
