//
//  ViewController.m
//  Runner
//
//  Created by Andy on 2019/5/30.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "ViewController.h"
#import "ADFlutterRouter.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSouce;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 44;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
    self.dataSouce = @[
                       @{
                           @"title" : @"Hello Flutter",
                           @"key"   : @"hello_flutter",
                           @"param" : @{},
                           },
                       ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.row < self.dataSouce.count) {
        cell.textLabel.text = [self.dataSouce[indexPath.row] objectForKey:@"title"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row < self.dataSouce.count) {
        NSDictionary *dict = self.dataSouce[indexPath.row];
        NSLog(@"dict === %@", dict);
        [[ADFlutterRouter sharedRouter] openPage:dict[@"key"] params:dict[@"param"] animated:YES completion:^(BOOL f){}];
    }
}

@end
