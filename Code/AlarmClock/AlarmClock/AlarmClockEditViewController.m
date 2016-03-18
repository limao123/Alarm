//
//  AlarmClockEditViewController.m
//  AlarmClock
//
//  Created by 林涛 on 16/2/29.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "AlarmClockEditViewController.h"
#import "NSDate+Addition.h"
#import "RepeatSelectViewController.h"
#import "TagEditViewController.h"
#import "RingSelectViewController.h"
#import "FileUtil.h"
#import "AlarmClockManager.h"
#import "AlarmNotificationManager.h"

@interface AlarmClockEditViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation AlarmClockEditViewController

#pragma mark - navigationBar
- (void)storePressed:(id)sender {
    if (self.isNew) {
        self.alarmClock.fireDate = self.timePicker.date;
        [[AlarmClockManager shareAlarmClockManager] addAlarmClock:self.alarmClock];
        [AlarmNotificationManager addLocalAlarm:self.alarmClock];
    } else {
        self.alarmClock.fireDate = self.timePicker.date;
        [[AlarmClockManager shareAlarmClockManager] save];
        [AlarmNotificationManager updateAlarm:self.alarmClock];
    }

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)cancelPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - VC circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"存储" style:UIBarButtonSystemItemDone target:self action:@selector(storePressed:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
    self.navigationItem.leftBarButtonItem.action = @selector(cancelPressed:);
    self.navigationItem.title = @"添加闹钟";
    
    //懒加载
    if (!self.alarmClock) {
        self.alarmClock = [[AlarmClockEntity alloc] init];
        self.alarmClock.fireDate = [NSDate date];
        self.alarmClock.tagMessage = @"闹钟";
        self.alarmClock.isOpen = YES;
        self.alarmClock.soundPath = [[NSBundle mainBundle] pathForResource:@"ring1" ofType:@"wav"];
    }
    

    
    //设置观察者
    [self.alarmClock addObserver:self forKeyPath:@"repeatDaysInWeek" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.alarmClock addObserver:self forKeyPath:@"tagMessage" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.alarmClock addObserver:self forKeyPath:@"soundPath" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    //设置视图
    [self.timePicker setDate:self.alarmClock.fireDate];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * AlarmClockEditCell1Identifier = @"AlarmClockEditCell1";
    static NSString * AlarmClockEditCell2Identifier = @"AlarmClockEditCell2";
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:{
            cell = [tableView dequeueReusableCellWithIdentifier:AlarmClockEditCell1Identifier forIndexPath:indexPath];
            cell.textLabel.text = @"重复";
            cell.detailTextLabel.text = [self getRepeatString:self.alarmClock.repeatDaysInWeek];
        }
            break;
            
        case 1:{
            cell = [tableView dequeueReusableCellWithIdentifier:AlarmClockEditCell1Identifier forIndexPath:indexPath];
            cell.textLabel.text = @"标签";
            cell.detailTextLabel.text = self.alarmClock?self.alarmClock.tagMessage:@"";
        }
            break;
            
        case 2:{
            cell = [tableView dequeueReusableCellWithIdentifier:AlarmClockEditCell1Identifier forIndexPath:indexPath];
            cell.textLabel.text = @"铃声";
            cell.detailTextLabel.text = self.alarmClock.soundPath?[FileUtil getFileNameFromPath:self.alarmClock.soundPath]:@"ring1";
        }
            break;
            
        case 3:{
            cell = [tableView dequeueReusableCellWithIdentifier:AlarmClockEditCell2Identifier forIndexPath:indexPath];
            UISwitch *cellSwitch = [cell.contentView viewWithTag:1];
            [cellSwitch setOn:self.alarmClock.isLaterRepeat];
        }
            break;
            
        default:
            break;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            RepeatSelectViewController *repeatSelectVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RepeatSelectVC"];;
            repeatSelectVC.repeatDaysInWeek = self.alarmClock.repeatDaysInWeek;
            __weak typeof(self) weakSelf = self;
            repeatSelectVC.block = ^(NSArray *selectedDays){
                __strong typeof(self)strongSelf = weakSelf;
                [strongSelf.alarmClock setValue:selectedDays forKey:@"repeatDaysInWeek"];
            };
            [self.navigationController pushViewController:repeatSelectVC animated:YES];
        }
            break;
            
        case 1:{
            TagEditViewController *tagEditVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TagEditVC"];
            tagEditVC.tag = self.alarmClock.tagMessage;
            __weak typeof(self) weakSelf = self;
            tagEditVC.block = ^(NSString *tag){
                __strong typeof(self) strongSelf = weakSelf;
                [strongSelf.alarmClock setValue:tag forKey:@"tagMessage"];
            };
            [self.navigationController pushViewController:tagEditVC animated:YES];
        }
            break;
            
        case 2:{
            RingSelectViewController *ringSelectVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RingSelectVC"];
            ringSelectVC.ringPath = self.alarmClock.soundPath;
            __weak typeof(self) weakSelf = self;
            ringSelectVC.block = ^(NSString *ringPath){
                __strong typeof(self) strongSelf = weakSelf;
                [strongSelf.alarmClock setValue:ringPath forKey:@"soundPath"];
            };
            [self.navigationController pushViewController:ringSelectVC animated:YES];
            
        }
            break;
            
            
        default:
            break;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        return NO;
    }
    return YES;
}

- (IBAction)switchChanged:(UISwitch *)sender {
    self.alarmClock.isLaterRepeat = sender.isOn;
}

- (NSString *)getRepeatString:(NSArray *)repeatDayInWeek{
    if (repeatDayInWeek.count == 7) {
        return @"每天";
    } else if (repeatDayInWeek.count == 5 &&
               ([repeatDayInWeek containsObject:@0] &&
                [repeatDayInWeek containsObject:@1] &&
                [repeatDayInWeek containsObject:@2] &&
                [repeatDayInWeek containsObject:@3] &&
                [repeatDayInWeek containsObject:@4])) {
                   return @"工作日";
               } else if (repeatDayInWeek.count == 0) {
                   return @"不重复";
               } else if (repeatDayInWeek.count == 1) {
                   NSInteger day = [self.alarmClock.repeatDaysInWeek[0] integerValue];
                   NSString *dayStr = [[RepeatSelectViewController weeksList] objectAtIndex:day];
                   return [NSString stringWithFormat:@"每周%@",dayStr];
               } else {
                   NSString *display  = @"";
                   for (NSNumber *day in repeatDayInWeek) {
                       NSString *dayStr = [[RepeatSelectViewController weeksList] objectAtIndex:[day integerValue]];
                       display = [display stringByAppendingString:[NSString stringWithFormat:@" 周%@",dayStr]];
                   }
                   return display;
               }
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    
}

#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSIndexPath *indexPath;
    
    if ([keyPath isEqualToString:@"repeatDaysInWeek"]) {
        indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    
    if([keyPath isEqualToString:@"tagMessage"]){
        indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    }
    
    if([keyPath isEqualToString:@"soundPath"]){
        indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    }
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
}

- (void)dealloc{
    [self.alarmClock removeObserver:self forKeyPath:@"repeatDaysInWeek" context:NULL];
    [self.alarmClock removeObserver:self forKeyPath:@"tagMessage" context:NULL];
    [self.alarmClock removeObserver:self forKeyPath:@"soundPath" context:NULL];
    
}



@end
