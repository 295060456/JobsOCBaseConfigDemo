# GTMBase64

## 使用方法
* 导入到iOS项目工程
  * ```objective-c
    #import "GTMBase64.h"
    ```
  * 【注意】开启ARC。解决方法：***-fno-objc-arc***
## 常用的方法
```objective-c
+ (NSString*)md5_base64: (NSString *) inPutText;
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;
+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;
```
