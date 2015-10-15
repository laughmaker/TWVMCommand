//
//  TWCommand.h
//  StackViewDemo
//
//  Created by 何振东 on 15/10/13.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWVMCommandResult.h"


// 命令执行状态
typedef NS_ENUM(NSUInteger, TWCommandState) {
    TWCommandStateSucceed,
    TWCommandStateFailed,
    TWCommandStateExecuting,
    TWCommandStateCancel
};


// 命令执行结束后的回调
typedef void (^TWCommandCompletionBlock) (id data, NSError *error);

// 命令执行代码块，输入参数，结果后调用回调block
typedef void (^TWCommandExecutionBlock) (id input, TWCommandCompletionBlock completionHandler);

// 取消命令回调
typedef void (^TWCommandCancelBlock) ();


/**
 *  MVVM命令执行器
 */
@interface TWVMCommand : NSObject

// 命令执行状态
@property (nonatomic, readonly) TWCommandState state;

// 执行结果集
@property (nonatomic, readonly) TWVMCommandResult *result;

// 以执行代码块和取消代码块初始化
- (instancetype)initWithExecutionHandler:(TWCommandExecutionBlock)executionHandler;
- (instancetype)initWithExecutionHandler:(TWCommandExecutionBlock)executionHandler cancelHandler:(TWCommandCancelBlock)cancelHandler;

// 执行命令
- (void)execute:(id)input;

// 取消命令
- (void)cancel;

@end
