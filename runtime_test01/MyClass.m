//
//  MyClass.m
//  runtime_test01
//
//  Created by lisa on 2017/6/1.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import "MyClass.h"

@interface MyClass ()
{
    NSInteger       _instance1;
    
    NSString        * _instance2;
}
@property (nonatomic, assign) NSUInteger integer;

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2;
@end
@implementation MyClass

+ (void)classMethod1 {  //类方法一
    
}

- (void)method1 {  //实例方法一
    NSLog(@"call method method1");
}

- (void)method2 {
    
}

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2 { //参数一 和参数三
    
    NSLog(@"arg1 : %ld, arg2 : %@", arg1, arg2);
}



















@end
