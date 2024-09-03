//
//  DebugLogDescription.m
//  JobsComment
//
//  Created by Jobs on 2021/3/30.
//

#import "DebugLogDescription.h"

#ifdef DEBUG
#pragma mark —— 打印model的内部属性内容
@implementation NSObject (DebugDescription)

+ (void)redirectNSlogToDocumentFolder{
    
    //如果已经连接Xcode调试则不输出到文件
    if(isatty(STDOUT_FILENO)) return;
    
    NSDateFormatter *dateFormatter = NSDateFormatter.new;
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:NSDate.date];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@.log",currentDateStr];
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    // 先删除已经存在的文件
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    [defaultManager removeItemAtPath:logFilePath error:nil];
    
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
}
/// debugDescription方法只会在调试po的时候调用，而在代码中打印不会调用
- (NSString *)debugDescription {
    //判断是否时NSArray 或者NSDictionary NSNumber 如果是的话直接返回 debugDescription
    if ([self isKindOfClass:NSArray.class] ||
        [self isKindOfClass:NSDictionary.class] ||
        [self isKindOfClass:NSString.class] ||
        [self isKindOfClass:NSNumber.class]) {
        return [self debugDescription];
    }
    //声明一个字典
    NSMutableDictionary *dictionary = NSMutableDictionary.dictionary;
    //得到当前class的所有属性
    uint count;
    objc_property_t *properties = class_copyPropertyList(self.class, &count);
    //循环并用KVC得到每个属性的值
    for (int i = 0; i<count; i++) {
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        id value = @"nil";
        @try {
            value = self.valueForKey(name) ?: @"nil"; //默认值为nil字符串
        }
        @catch (NSException *exception) {
            NSLog(@"Exception: %@", exception);
            value = @"nil"; // or handle the exception as needed
        }
        [dictionary setObject:value forKey:name];//装载到字典里
    }
    //释放
    free(properties);
    //return
    return [NSString stringWithFormat:@"<%@: %p> -- %@",self.class,self,dictionary];
}
/// 将obj转换成json字符串。如果失败则返回nil.
-(NSString *)convertToJsonString {
    //先判断是否能转化为JSON格式
    if (![NSJSONSerialization isValidJSONObject:self]) return nil;
    NSError *error = nil;
    NSJSONWritingOptions jsonOptions = NSJSONWritingPrettyPrinted;
    if (@available(iOS 11.0, *)) {
        //11.0之后，可以将JSON按照key排列后输出，看起来会更舒服
        jsonOptions = NSJSONWritingPrettyPrinted | NSJSONWritingSortedKeys;
    }
    //核心代码，字典转化为有格式输出的JSON字符串
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error || !jsonData) return nil;
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
#pragma mark —— 打印NSDictionary相关子类的内容
@implementation NSDictionary (DebugDescription)
//用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)printlog_descriptionWithLocale:(id)locale{
    return self.convertToJsonString ? : [self printlog_descriptionWithLocale:locale];/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
}
//用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)printlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return self.convertToJsonString ? : [self printlog_descriptionWithLocale:locale indent:level];/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
}
//用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)printlog_debugDescription{
    return self.convertToJsonString ? : self.printlog_debugDescription;/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
}
//在load方法中完成方法交换
+ (void)load {
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle(self.class,
                      @selector(descriptionWithLocale:),
                      @selector(printlog_descriptionWithLocale:));
        MethodSwizzle(self.class,
                      @selector(descriptionWithLocale:indent:),
                      @selector(printlog_descriptionWithLocale:indent:));
        MethodSwizzle(self.class,
                      @selector(debugDescription),
                      @selector(printlog_debugDescription));
    });
}

@end
#pragma mark —— 打印NSArray相关子类的内容
@implementation NSArray (DebugDescription)
//在load方法中完成方法交换
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle(self.class,
                      @selector(descriptionWithLocale:),
                      @selector(printlog_descriptionWithLocale:));
        MethodSwizzle(self.class,
                      @selector(descriptionWithLocale:indent:),
                      @selector(printlog_descriptionWithLocale:indent:));
        MethodSwizzle(self.class,
                      @selector(debugDescription),
                      @selector(printlog_debugDescription));
    });
}
//用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)printlog_descriptionWithLocale:(id)locale{
    return self.convertToJsonString ? : [self printlog_descriptionWithLocale:locale];/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
}
//用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)printlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return self.convertToJsonString ? : [self printlog_descriptionWithLocale:locale indent:level];/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
}
//用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)printlog_debugDescription{
    return self.convertToJsonString ? : self.printlog_debugDescription;
}

@end

#endif
