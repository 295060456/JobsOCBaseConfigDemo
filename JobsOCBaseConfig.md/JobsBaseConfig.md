#  JobsOCBaseConfig
[***打开苹果的反馈助理***](# applefeedback://)
[toc]
## 替代系统 @selector(selector) ,改用Block的方式调用代码
* 好处：使得代码逻辑和形式上不割裂
* 全局代码定位于 `@interface NSObject (DynamicInvoke)`
  * *定义*
    ```objective-c
    /// 替代系统 @selector(selector) ,用Block的方式调用代码，使得代码逻辑和形式上不割裂
    /// - Parameters:
    ///   - block: 最终的执行体
    ///   - selectorName: 实际调用的方法名（可不填），用于对外输出和定位调用实际使用的方法
    ///   - target: 执行目标
    SEL _Nullable selectorBlocks(JobsReturnIDBySelectorBlock,
                                 NSString *_Nullable selectorName,
                                 id _Nullable target);
    ```
  * *调用示例*
    ```objective-c
    @jobs_weakify(self)
    UIMenuItem *copyItem = [UIMenuItem.alloc initWithTitle:Internationalization(@"请复制")
                                                    action:selectorBlocks(^id _Nullable(id  _Nullable weakSelf,
                                                                                        id  _Nullable arg) {
        @jobs_strongify(self)
        if (self.returnObjectByGestureRecognizerBlock) self.returnObjectByGestureRecognizerBlock(arg);
        [self copyText];
        return nil;
    }, NSStringFromSelector(@selector(copyText)),self)];
    ```
  * *调用结果*
  
  *  ![image-20240320211238339](./assets/替代系统 @selector(selector) ,改用Block的方式调用代码.png)
