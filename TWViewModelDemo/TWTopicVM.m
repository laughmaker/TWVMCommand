//
//  TWTopicVM.m
//  TWViewModelDemo
//
//  Created by 何振东 on 15/10/14.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import "TWTopicVM.h"
#import "TWURLRequest.h"

#define url @"http://api.3water3.com/topic/getTopicList"

@implementation TWTopicVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.vmCommand = [[TWVMCommand alloc] initWithExecutionHandler:^(id input, TWCommandCompletionBlock completionHandler) {
            [TWURLRequest post:url params:input completionHandler:^(NSDictionary *data, NSError *error) {
                NSArray *topics = [TWTopic objectArrayWithKeyValuesArray:data[@"data"]];
                if (completionHandler) {
                    completionHandler(topics, error);
                }
            }];
        }];
    }
    
    return self;
}

- (void)exeute:(id)input
{
    [self.vmCommand execute:input];
}

- (void)cancel
{
    [self.vmCommand cancel];
}

@end
