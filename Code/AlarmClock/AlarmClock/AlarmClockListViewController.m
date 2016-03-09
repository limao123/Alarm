//
//  AlarmClockListViewController.m
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "AlarmClockListViewController.h"
#import "AlarmClockViewControllerCell.h"
#import "AlarmClockManager.h"

static NSString * AlarmClockIdentifier = @"AlarmClockCell";

@interface AlarmClockListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic) NSArray *clocks;

@end

@implementation AlarmClockListViewController

- (IBAction)addAlarmClock:(id)sender {
}

- (IBAction)editButton:(UIBarButtonItem *)sender {
    if (self.tableView.editing == YES) {
        [self.tableView setEditing:NO animated:YES];
        sender.title = @"编辑";
    } else {
        [self.tableView setEditing:YES animated:YES];
        sender.title = @"完成";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.clocks = [[AlarmClockManager shareAlarmClockManager] alarmClocks];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.clocks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AlarmClockViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:AlarmClockIdentifier forIndexPath:indexPath];
    AlarmClockEntity *entity = self.clocks[indexPath.row];
    [cell setDisplayView:entity];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //
    }
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
