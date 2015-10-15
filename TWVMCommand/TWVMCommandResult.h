//
//  TWCommandResult.h
//  StackViewDemo
//
//  Created by 何振东 on 15/10/13.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  定义数据返回结果
 */
@interface TWVMCommandResult : NSObject

// 错误信息
@property (nonatomic, readonly) NSError *error;

// 返回数据
@property (nonatomic, readonly) id data;


// 以结果内容和错误码初始化结果集
- (instancetype)initWithData:(id)data error:(NSError *)error;

@end
