//
//  DynamicInvoke.m
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import "DynamicInvoke.h"

@interface DynamicInvoke ()

@end

@implementation DynamicInvoke

-(instancetype)init{
    if (self = [super init]) {
        [self invoke1];
//        [self invoke2];
//        [self invoke3];
//        [self invoke4];
    }return self;
}

-(void)invoke1{
    [NSObject methodName:@"test1"
               targetObj:self
             paramarrays:nil];
    
    [NSObject methodName:@"test2"
               targetObj:self
             paramarrays:@[]];
    
    [NSObject methodName:@"test3:"
               targetObj:self
             paramarrays:@[@"str1"]];
    
    [NSObject methodName:@"test4:str2:"
               targetObj:self
             paramarrays:@[@"str1",@"str2"]];
    
    [NSObject methodName:@"test5:str2:str3:"
               targetObj:self
             paramarrays:@[@"str1",@"str2",@"str3"]];
    
    [NSObject methodName:@"test6:str2:str3:str4:"
               targetObj:self
             paramarrays:@[@"str1",@"str2",@"str3",@"str4"]];

    [NSObject methodName:@"test7:"
               targetObj:self
             paramarrays:@[@"block1"]];
    
    [NSObject methodName:@"test8:block2:"
               targetObj:self
             paramarrays:@[@"block1",@"block2"]];
    
    [NSObject methodName:@"test9:block2:block3:"
               targetObj:self
             paramarrays:@[@"block1",@"block2",@"block3"]];
    
    [NSObject methodName:@"test10:block2:block3:block4:"
               targetObj:self
             paramarrays:@[@"block1",@"block2",@"block3",@"block4"]];
}

-(void)invoke2{
    [NSObject methodName:@"Test1"
               targetObj:DynamicInvoke.class
             paramarrays:nil];
    
    [NSObject methodName:@"Test2"
               targetObj:DynamicInvoke.class
             paramarrays:@[]];
    
    [NSObject methodName:@"Test3:"
               targetObj:DynamicInvoke.class
             paramarrays:@[@"str1"]];
    
    [NSObject methodName:@"Test4:str2:"
               targetObj:DynamicInvoke.class
             paramarrays:@[@"str1",@"str2"]];
    
    [NSObject methodName:@"Test5:str2:str3:"
               targetObj:DynamicInvoke.class
             paramarrays:@[@"str1",@"str2",@"str3"]];
    
    [NSObject methodName:@"Test6:str2:str3:str4:"
               targetObj:DynamicInvoke.class
             paramarrays:@[@"str1",@"str2",@"str3",@"str4"]];

    [NSObject methodName:@"Test7:"
               targetObj:DynamicInvoke.class
             paramarrays:@[@"block1"]];
    
    [NSObject methodName:@"Test8:block2:"
               targetObj:DynamicInvoke.class
             paramarrays:@[@"block1",@"block2"]];
    
    [NSObject methodName:@"Test9:block2:block3:"
               targetObj:DynamicInvoke.class
             paramarrays:@[@"block1",@"block2",@"block3"]];
    
    [NSObject methodName:@"Test10:block2:block3:block4:"
               targetObj:DynamicInvoke.class
             paramarrays:@[@"block1",@"block2",@"block3",@"block4"]];
}

-(void)invoke3{
    id test11 = [NSObject methodName:@"test11"
                           targetObj:self
                         paramarrays:nil];
    
    id test12 = [NSObject methodName:@"test12"
                           targetObj:self
                         paramarrays:@[]];
    
    id test13 = [NSObject methodName:@"test13:"
                           targetObj:self
                         paramarrays:@[@"str1"]];
    
    id test14 = [NSObject methodName:@"test14:str2:"
                           targetObj:self
                         paramarrays:@[@"str1",@"str2"]];
    
    id test15 = [NSObject methodName:@"test15:str2:str3:"
                           targetObj:self
                         paramarrays:@[@"str1",@"str2",@"str3"]];
    
    id test16 = [NSObject methodName:@"test16:str2:str3:str4:"
                           targetObj:self
                         paramarrays:@[@"str1",@"str2",@"str3",@"str4"]];

    id test17 = [NSObject methodName:@"test17:"
                           targetObj:self
                         paramarrays:@[@"block1"]];
    
    id test18 = [NSObject methodName:@"test18:block2:"
                           targetObj:self
                         paramarrays:@[@"block1",@"block2"]];
    
    id test19 = [NSObject methodName:@"test19:block2:block3:"
                           targetObj:self
                         paramarrays:@[@"block1",@"block2",@"block3"]];
    
    id test20 = [NSObject methodName:@"test20:block2:block3:block4:"
                           targetObj:self
                         paramarrays:@[@"block1",@"block2",@"block3",@"block4"]];
    
    NSMutableArray *temp = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
        arr.add(test11);
        arr.add(test12);
        arr.add(test13);
        arr.add(test14);
        arr.add(test15);
        arr.add(test16);
        arr.add(test17);
        arr.add(test18);
        arr.add(test19);
        arr.add(test20);
    });NSLog(@"temp = %@",temp);
}

-(void)invoke4{
    id Test11 = [NSObject methodName:@"Test11"
                           targetObj:DynamicInvoke.class
                         paramarrays:nil];
    
    id Test12 = [NSObject methodName:@"Test12"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[]];
    
    id Test13 = [NSObject methodName:@"Test13:"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[@"str1"]];
    
    id Test14 = [NSObject methodName:@"Test14:str2:"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[@"str1",@"str2"]];
    
    id Test15 = [NSObject methodName:@"Test15:str2:str3:"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[@"str1",@"str2",@"str3"]];
    
    id Test16 = [NSObject methodName:@"Test16:str2:str3:str4:"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[@"str1",@"str2",@"str3",@"str4"]];

    id Test17 = [NSObject methodName:@"Test17:"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[@"block1"]];
    
    id Test18 = [NSObject methodName:@"Test18:block2:"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[@"block1",@"block2"]];
    
    id Test19 = [NSObject methodName:@"Test19:block2:block3:"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[@"block1",@"block2",@"block3"]];
    
    id Test20 = [NSObject methodName:@"Test20:block2:block3:block4:"
                           targetObj:DynamicInvoke.class
                         paramarrays:@[@"block1",@"block2",@"block3",@"block4"]];
    NSMutableArray *temp = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
        arr.add(Test11);
        arr.add(Test12);
        arr.add(Test13);
        arr.add(Test14);
        arr.add(Test15);
        arr.add(Test16);
        arr.add(Test17);
        arr.add(Test18);
        arr.add(Test19);
        arr.add(Test20);
    });NSLog(@"temp = %@",temp);
}
#pragma mark —— 实例方法（不带返回值）
-(void)test1{
    NSLog(@"void-test1");
}
-(void)test2{
    NSLog(@"void-test2");
}
-(void)test3:(NSString *)str1{
    NSLog(@"void-test3");
}
-(void)test4:(NSString *)str1 str2:(NSString *)str2{
    NSLog(@"void-test4");
}
-(void)test5:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{
    NSLog(@"void-test5");
}
-(void)test6:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4{
    NSLog(@"void-test6");
}
-(void)test7:(jobsByIDBlock)block1{
    NSLog(@"void-test7");
}
-(void)test8:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2{
    NSLog(@"void-test8");
}
-(void)test9:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3{
    NSLog(@"void-test9");
}
-(void)test10:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4{
    NSLog(@"void-test10");
}
#pragma mark —— 实例方法（带返回值）
-(NSString *)test11{
    NSLog(@"NSString-test11");
    return @"NSString-test11";
}
-(NSString *)test12{
    NSLog(@"NSString-test12");
    return @"NSString-test12";
}
-(NSString *)test13:(NSString *)str1{
    NSLog(@"NSString-test13+str1");
    return @"NSString-test13+str1";
}
-(NSString *)test14:(NSString *)str1 str2:(NSString *)str2{
    NSLog(@"NSString-test14+str1+str2");
    return @"NSString-test14+str1+str2";
}
-(NSString *)test15:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{
    NSLog(@"NSString-test15+str1+str2+str3");
    return @"NSString-test15+str1+str2+str3";
}
-(NSString *)test16:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4{
    NSLog(@"NSString-test16+str1+str2+str3+str4");
    return @"NSString-test16+str1+str2+str3+str4";
}
-(NSString *)test17:(jobsByIDBlock)block1{
    NSLog(@"NSString-test17+block1");
    return @"NSString-test17+block1";
}
-(NSString *)test18:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2{
    NSLog(@"NSString-test18+block1+block2");
    return @"NSString-test18+block1+block2";
}
-(NSString *)test19:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3{
    NSLog(@"NSString-test19+block1+block2+block3");
    return @"NSString-test19+block1+block2+block3";
}
-(NSString *)test20:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4{
    NSLog(@"NSString-test20+block1+block2+block3+block4");
    return @"NSString-test20+block1+block2+block3+block4";
}
#pragma mark —— 类方法（不带返回值）
+(void)Test1{
    NSLog(@"void+Test1");
}
+(void)Test2{
    NSLog(@"void+Test2");
}
+(void)Test3:(NSString *)str1{
    NSLog(@"void+Test3+str1");
}
+(void)Test4:(NSString *)str1 str2:(NSString *)str2{
    NSLog(@"void+Test4+str1+str2");
}
+(void)Test5:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{
    NSLog(@"void+Test5+str1+str2+str3");
}
+(void)Test6:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4{
    NSLog(@"void+Test6+str1+str2+str3+str4");
}
+(void)Test7:(jobsByIDBlock)block1{
    NSLog(@"void+Test7+block1");
}
+(void)Test8:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2{
    NSLog(@"void+Test8+block1+block2");
}
+(void)Test9:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3{
    NSLog(@"void+Test9+block1+block2+block3");
}
+(void)Test10:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4{
    NSLog(@"void+Test10+block1+block2+block3+block4");
}
#pragma mark —— 类方法（带返回值）
+(NSString *)Test11{
    NSLog(@"void+Test11");
    return @"void+Test11";
}
+(NSString *)Test12{
    NSLog(@"void+Test12");
    return @"void+Test12";
}
+(NSString *)Test13:(NSString *)str1{
    NSLog(@"void+Test13+str1");
    return @"void+Test13+str1";
}
+(NSString *)Test14:(NSString *)str1 str2:(NSString *)str2{
    NSLog(@"void+Test14+str1+str2");
    return @"void+Test14+str1+str2";
}
+(NSString *)Test15:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{
    NSLog(@"void+Test15+str1+str2+str3");
    return @"void+Test15+str1+str2+str3";
}
+(NSString *)Test16:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4{
    NSLog(@"void+Test16+str1+str2+str3+str4");
    return @"void+Test16+str1+str2+str3+str4";
}
+(NSString *)Test17:(jobsByIDBlock)block1{
    NSLog(@"void+Test17+block1");
    return @"void+Test17+block1";
}
+(NSString *)Test18:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2{
    NSLog(@"void+Test18+block1+block2");
    return @"void+Test18+block1+block2";
}
+(NSString *)Test19:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3{
    NSLog(@"void+Test19+block1+block2+block3");
    return @"void+Test19+block1+block2+block3";
}
+(NSString *)Test20:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4{
    NSLog(@"void+Test20+block1+block2+block3+block4");
    return @"void+Test20+block1+block2+block3+block4";
}

@end
