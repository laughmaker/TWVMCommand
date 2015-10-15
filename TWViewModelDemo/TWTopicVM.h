//
//  TWTopicVM.h
//  TWViewModelDemo
//
//  Created by 何振东 on 15/10/14.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWVMCommand.h"
#import "TWTopic.h"
#import "MJExtension.h"

@interface TWTopicVM : NSObject
@property (nonatomic, strong) TWVMCommand *vmCommand;

- (void)exeute:(id)input;

- (void)cancel;

@end
