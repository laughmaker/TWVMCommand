//
//  ViewController.m
//  TWViewModelDemo
//
//  Created by 何振东 on 15/10/14.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import "ViewController.h"
#import "TWTopicVM.h"
#import "FBKVOController.h"

@interface ViewController ()
@property (nonatomic, strong) TWTopicVM *topicVM;
- (IBAction)getData:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.KVOController observe:self.topicVM keyPath:@"vmCommand.result" options:NSKeyValueObservingOptionInitial| NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        TWVMCommandResult *newValue = change[NSKeyValueChangeNewKey];
        if (![newValue isEqual:[NSNull null]]) {
            NSLog(@"newValue:%@", [newValue.data[0] keyValues]);
        }
    }];
}


- (TWTopicVM *)topicVM
{
    if (!_topicVM) {
        _topicVM = [[TWTopicVM alloc] init];
    }
    return _topicVM;
}

- (IBAction)getData:(id)sender
{
    NSDictionary *params = @{@"pageIndex": @(1), @"pageSize": @(2)};
    [self.topicVM exeute:params];
}

@end
