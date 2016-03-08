//
//  RingSelectViewController.m
//  AlarmClock
//
//  Created by 林涛 on 16/3/7.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "RingSelectViewController.h"
#import "FileUtil.h"
#import <AudioToolbox/AudioToolbox.h>

@interface RingSelectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic) NSArray *ringPaths;
@end

@implementation RingSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.ringPaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"wav" inDirectory:nil];
    if(!self.ringPath){
        self.ringPath = self.ringPaths[0];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.block) {
        self.block(self.ringPath);
    }
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ringPaths.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RingSelectCell" forIndexPath:indexPath];
    cell.textLabel.text = [FileUtil getFileNameFromPath:self.ringPaths[indexPath.row]];
    if ([self.ringPath isEqualToString:self.ringPaths[indexPath.row]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.ringPath = self.ringPaths[indexPath.row];
    [self.tableView reloadData];
    [self playSound:self.ringPath];
}

- (void)playSound:(NSString *)soundPath{
    if (soundPath) {
        SystemSoundID sound;
        OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundPath],&sound);
        
        if (error != kAudioServicesNoError) {//获取的声音的时候，出现错误
            sound = nil;
        }
        AudioServicesPlaySystemSound(sound);
    }
}

@end
