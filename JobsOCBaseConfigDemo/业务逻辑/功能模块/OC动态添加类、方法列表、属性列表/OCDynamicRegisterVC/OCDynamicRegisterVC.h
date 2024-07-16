//
//  OCDynamicRegisterVC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/9.
//

#import <objc/message.h>
#import <objc/runtime.h>

#import "NSObject+Class.h"
#import "BaseViewController.h"
#import "OCDynamic.h"
#import "DynamicInvoke.h"

NS_ASSUME_NONNULL_BEGIN
/**
 
 Objective-C语言是一门动态语言，它将很多静态语言在编译和链接时期做的事放到了运行时来处理。这种动态语言的优势在于：我们写代码时更具灵活性，如我们可以把消息转发给我们想要的对象，或者随意交换一个方法的实现等。

 这种特性意味着Objective-C不仅需要一个编译器，还需要一个运行时系统来执行编译的代码。对于Objective-C来说，这个运行时系统就像一个操作系统一样：它让所有的工作可以正常的运行。这个运行时系统即Objc Runtime。Objc Runtime其实是一个Runtime库，它基本上是用C和汇编写的，这个库使得C语言有了面向对象的能力。

 Runtime库主要做下面几件事：

 封装：在这个库中，对象可以用C语言中的结构体表示，而方法可以用C函数来实现，另外再加上了一些额外的特性。这些结构体和函数被runtime函数封装后，我们就可以在程序运行时创建，检查，修改类、对象和它们的方法了。
 找出方法的最终执行代码：当程序执行[object doSomething]时，会向消息接收者(object)发送一条消息(doSomething)，runtime会根据消息接收者是否能响应该消息而做出不同的反应。这将在后面详细介绍。
 Objective-C runtime目前有两个版本：Modern runtime和Legacy runtime。Modern Runtime覆盖了64位的Mac OS X Apps，还有iOS Apps，Legacy Runtime是早期用来给32位 Mac OS X Apps 用的，也就是可以不用管就是了。
 
 */
@interface OCDynamicRegisterVC : BaseViewController

@end

NS_ASSUME_NONNULL_END
