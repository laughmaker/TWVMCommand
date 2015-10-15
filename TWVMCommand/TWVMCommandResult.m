//
//  TWCommandResult.m
//  StackViewDemo
//
//  Created by 何振东 on 15/10/13.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import "TWVMCommandResult.h"

@interface TWVMCommandResult ()
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) id data;

@end


@implementation TWVMCommandResult

- (instancetype)initWithData:(id)data error:(NSError *)error
{
    self = [super init];
    if (self) {
        self.data = data;
        self.error = error;
    }
    return self;
}

@end
