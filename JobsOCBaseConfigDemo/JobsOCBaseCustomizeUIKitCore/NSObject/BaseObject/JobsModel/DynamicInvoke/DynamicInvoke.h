//
//  DynamicInvoke.h
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "NSObject+DynamicInvoke.h"

NS_ASSUME_NONNULL_BEGIN
/**
 此类只做示例
 演示对（-）实例方法和(+)类方法的动态调用
 ❤️值得注意的几点：
 1、OC是自诉语言，对方法名的大小写敏感；
 2、带参数的方法名后面需要拼接冒号
 3、不带参数的方法调用【不管是对（-）实例方法还是对(+)类方法】，paramarrays参数可以传nil也可以传空数组
 4、带参数的方法调用【不管是对（-）实例方法还是对(+)类方法】，paramarrays参数传数组，数组里面是各项参数名的统一数据结构的对象形式【因为数组里面的数据是要求必须是统一的结构】
 */
@interface DynamicInvoke : NSObject
#pragma mark —— 实例方法（不带返回值）
-(void)test1;
-(void)test2;
-(void)test3:(NSString *)str1;
-(void)test4:(NSString *)str1 str2:(NSString *)str2;
-(void)test5:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3;
-(void)test6:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4;
-(void)test7:(jobsByIDBlock)block1;
-(void)test8:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2;
-(void)test9:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3;
-(void)test10:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4;
#pragma mark —— 实例方法（带返回值）
-(NSString *)test11;
-(NSString *)test12;
-(NSString *)test13:(NSString *)str1;
-(NSString *)test14:(NSString *)str1 str2:(NSString *)str2;
-(NSString *)test15:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3;
-(NSString *)test16:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4;
-(NSString *)test17:(jobsByIDBlock)block1;
-(NSString *)test18:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2;
-(NSString *)test19:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3;
-(NSString *)test20:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4;
#pragma mark —— 类方法（不带返回值）
+(void)Test1;
+(void)Test2;
+(void)Test3:(NSString *)str1;
+(void)Test4:(NSString *)str1 str2:(NSString *)str2;
+(void)Test5:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3;
+(void)Test6:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4;
+(void)Test7:(jobsByIDBlock)block1;
+(void)Test8:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2;
+(void)Test9:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3;
+(void)Test10:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4;
#pragma mark —— 类方法（带返回值）
+(NSString *)Test11;
+(NSString *)Test12;
+(NSString *)Test13:(NSString *)str1;
+(NSString *)Test14:(NSString *)str1 str2:(NSString *)str2;
+(NSString *)Test15:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3;
+(NSString *)Test16:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4;
+(NSString *)Test17:(jobsByIDBlock)block1;
+(NSString *)Test18:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2;
+(NSString *)Test19:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3;
+(NSString *)Test20:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4;

@end

NS_ASSUME_NONNULL_END
