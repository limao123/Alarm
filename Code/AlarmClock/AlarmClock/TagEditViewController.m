//
//  TagEditViewController.m
//  AlarmClock
//
//  Created by 林涛 on 16/3/2.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "TagEditViewController.h"

@interface TagEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tagTextField;

@end

@implementation TagEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tagTextField.text = self.tag;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(returnPressed:)];
}

- (void)returnPressed:(UIBarButtonItem *)sender{
    if (self.block) {
        self.block(self.tagTextField.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
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
