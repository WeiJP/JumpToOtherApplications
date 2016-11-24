//
//  ViewController.m
//  三方app跳转
//
//  Created by use on 16/1/19.
//  Copyright © 2016年 wjp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *appsScheme;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _appsScheme = @[@"StudyTour://", @"weixin://", @"taobao://", @"newsapp://", @"mobilenotes://", @"prefs:root=SETTING", @"prefs:root=LOCATION_SERVICES"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:_appsScheme[indexPath.row]]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_appsScheme[indexPath.row]]];
    }
    else
    {
        NSLog(@"没安装啊卧槽");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = _appsScheme[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
