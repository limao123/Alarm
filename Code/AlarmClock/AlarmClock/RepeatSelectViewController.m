//
//  RepeatSelectViewController.m
//  AlarmClock
//
//  Created by 林涛 on 16/3/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "RepeatSelectViewController.h"

@interface RepeatSelectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *repeatDays;
@end

@implementation RepeatSelectViewController

+ (NSArray *)weeksList{
    static NSArray *array;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        array = @[@"一",@"二",@"三",@"四",@"五",@"六",@"日"];
    });
    return array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.repeatDays = [[NSMutableArray alloc] initWithArray:self.repeatDaysInWeek];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    if (self.block) {
//        self.block([self.repeatDays copy]);
//    }
//}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.block) {
        self.block([self.repeatDays sortedArrayUsingSelector:@selector(compare:)]);
    }
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"RepeatSelectCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"每周%@",[[self class] weeksList][indexPath.row]];
    
    NSNumber *selectedDay = [self determindWhichDay:indexPath.row];
    if (![self.repeatDaysInWeek containsObject:selectedDay]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSNumber *selectedDay = [self determindWhichDay:indexPath.row];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.repeatDays addObject:selectedDay];
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.repeatDays removeObject:selectedDay];
    }
}

- (NSNumber *)determindWhichDay:(NSInteger)row{
        return @(row);
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
