//
//  TWTopic.h
//  TWViewModelDemo
//
//  Created by 何振东 on 15/10/15.
//  Copyright © 2015年 LZA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWTopic : NSObject
@property (nonatomic, assign) NSInteger topicId;
@property (nonatomic, assign) NSTimeInterval createTime;
@property (nonatomic, assign) NSInteger star;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, assign) NSInteger status;

@end
