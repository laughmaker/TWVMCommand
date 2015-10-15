//
//  TWCommand.m
//  StackViewDemo
//
//  Created by 何振东 on 15/10/13.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import "TWVMCommand.h"

@interface TWVMCommand ()
@property (nonatomic, copy) TWVMCommandExecutionBlock commandExecutionBlock;
@property (nonatomic, copy) TWVMCommandCancelBlock commandCancelBlock;

@property (nonatomic, strong) TWVMCommandResult *result;
@property (nonatomic, assign) TWVMCommandState state;

@end

@implementation TWVMCommand

- (instancetype)initWithExecutionHandler:(TWVMCommandExecutionBlock)executionHandler
{
    self = [self initWithExecutionHandler:executionHandler cancelHandler:nil];
    return self;
}

- (instancetype)initWithExecutionHandler:(TWVMCommandExecutionBlock)executionHandler cancelHandler:(TWVMCommandCancelBlock)cancelHandler
{
    if (self = [super init]) {
        self.commandExecutionBlock = executionHandler;
        self.commandCancelBlock = cancelHandler;
    }
    
    return self;
}

- (void)execute:(id)input
{
    self.state = TWVMCommandStateExecuting;
    
    __weak typeof(self) weakSelf = self;
    TWVMCommandCompletionBlock completion = ^(id data, NSError *error) {
        __strong typeof(self) strongSelf = weakSelf;
        if (error) {
            strongSelf.state = TWVMCommandStateFailed;
        }
        else {
            strongSelf.state = TWVMCommandStateSucceed;
        }
        strongSelf.result = [[TWVMCommandResult alloc] initWithData:data error:error];
    };
    
    self.commandExecutionBlock(input, completion);
}

- (void)cancel
{
    self.state = TWVMCommandStateCancel;
    
    if (self.commandCancelBlock) {
        self.commandCancelBlock();
    }
}

@end
