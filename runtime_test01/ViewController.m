//
//  ViewController.m
//  runtime_test01
//
//  Created by lisa on 2017/6/1.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "EmptyClass.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    //为了运行ReportFunction，我们需要创建一个动态实例来创建类调用report方法
    
//    [self addMethod];
    
    [self addMethodWithParameters];
    

}

void sayHello(id self, SEL _cmd) {
    NSLog(@"Hello");
}

- (void)addMethod {
    class_addMethod([EmptyClass class], @selector(sayHello2), (IMP)sayHello, "v@:");
    
    // Test Method
    EmptyClass *instance = [[EmptyClass alloc] init];
//    [instance sayHello2];
    
    [instance performSelector:@selector(sayHello2)];  // 动态添加的方法   用performSelector 调用

}




/**
 比如我们要添加一个这样的方法：-(int)say:(NSString *)str;
 相应的实现函数就应该是这样：
 
 */

int say(id self, SEL _cmd, NSString *str) {
    NSLog(@"%@", str);
    return 100;//随便返回个值
}
- (void)addMethodWithParameters
{
   class_addMethod([EmptyClass class], @selector(say), (IMP)say, "i@:@");
    
    EmptyClass *instance = [[EmptyClass alloc] init];
//    int a = [instance say:@"something"];
    
    int a = (int )[instance performSelector:@selector(say) withObject:@"something"];
    NSLog(@"1111111:   %d", a);
}























































//在运行时 创建一个NSError的子类
- (void)subError
{
    Class newClass =
    objc_allocateClassPair([NSError class], "RuntimeErrorSubclass", 0); //定义新的类
    class_addMethod(newClass, @selector(report), (IMP)ReportFunction, "v@:"); //而method_imp的数据类型是IMP，它是一个函数指针，
    objc_registerClassPair(newClass);
    
    id instanceOfNewClass =
    [[newClass alloc] initWithDomain:@"someDomain" code:0 userInfo:nil];
    [instanceOfNewClass performSelector:@selector(report)];

}
/*
 在运行时创建一个类只需要3个步骤:
 为”class pair”分配内存 (使用objc_allocateClassPair).
 添加方法或成员变量到有需要的类里 (我已经使用class_addMethod添加了一个方法).
 注册类以便它能使用 (使用objc_registerClassPair).
 */
//ReportFunction函数就是添加的实例方法，具体实现如下：
void ReportFunction(id self, SEL _cmd)
{
    NSLog(@"This object is %p.", self);
    NSLog(@"Class is %@, and super is %@.", [self class], [self superclass]);
    
    Class currentClass = [self class];
    for (int i = 1; i < 5; i++)
    {
        NSLog(@"Following the isa pointer %d times gives %p", i, currentClass);
        currentClass = object_getClass(currentClass);
    }
    
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p", object_getClass([NSObject class]));
}

/*
 对象的地址是 0x10010c810.
 类的地址是 0x10010c600.
 元类的地址是 0x10010c630.
 根元类（NSObject的元类）的地址是 0x7fff71038480.
 NSObject元类的类是它本身.
 */

- (void)test01{
    NSString *str = @"hello world";
    if ([str isMemberOfClass:[NSString class]]) {
        // str is actual an instance of NSString
    } else {
        // str is not a NSString instance
    }
 
}


@end
