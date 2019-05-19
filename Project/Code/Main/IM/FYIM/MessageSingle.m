//
//  MessageSingle.m
//  Project
//
//  Created by 罗耀生 on 2019/5/7.
//  Copyright © 2019 CDJay. All rights reserved.
//

#import "MessageSingle.h"

@implementation MessageSingle

+ (MessageSingle *)shareInstance {
    static MessageSingle *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _myJoinGroupMessage = [NSMutableDictionary dictionary];
    }
    return self;
}

@end