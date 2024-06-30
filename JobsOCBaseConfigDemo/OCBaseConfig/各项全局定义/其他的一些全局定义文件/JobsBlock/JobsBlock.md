# JobsBlock

*不定参数Block【 使用示例】*

```objective-c
[self GettingPicBlock:^(id firstArg, ...)NS_REQUIRES_NIL_TERMINATION{
    @jobs_strongify(self)
    if (firstArg) {
        // 取出第一个参数
        NSLog(@"%@", firstArg);
        // 定义一个指向个数可变的参数列表指针；
        va_list args;
        // 用于存放取出的参数
        id arg = nil;
        // 初始化变量刚定义的va_list变量，这个宏的第二个参数是第一个可变参数的前一个参数，是一个固定的参数
        va_start(args, firstArg);
        // 遍历全部参数 va_arg返回可变的参数(a_arg的第二个参数是你要返回的参数的类型)
        if ([firstArg isKindOfClass:NSNumber.class]) {
            NSNumber *num = (NSNumber *)firstArg;
            for (int i = 0; i < num.intValue; i++) {
                arg = va_arg(args, id);
//                    NSLog(@"KKK = %@", arg);
                if ([arg isKindOfClass:UIImage.class]) {
                    NSLog(@"");
                }else if ([arg isKindOfClass:PHAsset.class]){
                    NSLog(@"");
                }else if ([arg isKindOfClass:NSString.class]){
                    NSLog(@"");
                }else if ([arg isKindOfClass:NSArray.class]){
                    NSLog(@"");
                }else{
                    NSLog(@"");
                }
            }
        }else{
            NSLog(@"");
        }
        // 清空参数列表，并置参数指针args无效
        va_end(args);
    }
}];
```

