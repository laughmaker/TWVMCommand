//
//  TWCommand.m
//  StackViewDemo
//
//  Created by 何振东 on 15/10/13.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import "TWVMCommand.h"

@interface TWVMCommand ()
@property (nonatomic, copy) TWCommandCompletionBlock commandCompletionBlock;
@property (nonatomic, copy) TWCommandExecutionBlock commandExecutionBlock;
@property (nonatomic, copy) TWCommandCancelBlock commandCancelBlock;
@property (nonatomic, strong) TWVMCommandResult *result;
@property (nonatomic, assign) TWCommandState state;

@end

@implementation TWVMCommand

- (instancetype)initWithExecutionHandler:(TWCommandExecutionBlock)executionHandler
{
    self = [self initWithExecutionHandler:executionHandler cancelHandler:nil];
    return self;
}

- (instancetype)initWithExecutionHandler:(TWCommandExecutionBlock)executionHandler cancelHandler:(TWCommandCancelBlock)cancelHandler
{
    if (self = [super init]) {
        self.commandExecutionBlock = executionHandler;
        self.commandCancelBlock = cancelHandler;
    }
    
    return self;
}

- (void)execute:(id)input
{
    self.state = TWCommandStateExecuting;
    
    if (!self.commandCompletionBlock) {
        __weak typeof(self) weakSelf = self;
        self.commandCompletionBlock = ^(id data,NSError *error) {
            __strong typeof(self) strongSelf = weakSelf;
            if (error) {
                strongSelf.state = TWCommandStateFailed;
            }
            else {
                strongSelf.state = TWCommandStateSucceed;
            }
            strongSelf.result = [[TWVMCommandResult alloc] initWithData:data error:error];
        };
    }
    
    self.commandExecutionBlock(input, self.commandCompletionBlock);
}

- (void)cancel
{
    self.state = TWCommandStateCancel;
    
    if (self.commandCancelBlock) {
        self.commandCancelBlock();
    }
}

@end
