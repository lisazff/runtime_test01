//
//  MyClass.h
//  runtime_test01
//
//  Created by lisa on 2017/6/1.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCopying, NSCoding>
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, copy) NSString *string;

- (void)method1;

- (void)method2;

+ (void)classMethod1;
@end
