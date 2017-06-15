//
//  Son.m
//  runtime_test01
//
//  Created by lisa on 2017/6/1.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import "Son.h"

@implementation Son
- (id)init
{
    self = [super init];
    if (self)
    {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}

@end
