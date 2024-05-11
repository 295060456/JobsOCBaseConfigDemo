//
//  JobsUserDefaults.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsUserDefaults_h
#define JobsUserDefaults_h
/**
 参考资料：https://juejin.cn/post/6844903854098612231
 
 1、用户卸载了应用后,NSUserDefaults保存的数据也将被清除
 2、NSUserDefaults保存的数据不会通过iTunes传递到另外的设备也不会存储到iCloud上面
 3、NSUserDefaults存储的数据是写入到plist文件下,所以用NSUserDefaults存储的数据应该是小型数据而不应该是数据量大的数据
 4、NSUserDefaults支持的数据类型有NSString、NSNumber、NSDate、NSArray、NSDictionary、BOOL、NSInteger、NSFloat等系统定义的数据类型。
 5、NSUserDefaults可以存储NSData类型的数据，所以要存储对象需要先把对象转化成NSData类型数据，对象要遵循 NSCopying,NSCoding协议（归档&解档）
 6、当我们存储的数据是可变类型时,读取后的数据将变为不可变类型
 7、当我们设置数据后,系统并不会立即保存到本地,而是会在一个系统觉得恰当的时间点进行存储,如果我们需要立即存储的话需要调用- (BOOL)synchronize;方法来实现
 8、synchronize将在不久后的未来被废弃掉
 9、当我们的NSUserDefaults实例所存储的数据变更时,系统会发送NSUserDefaultsDidChangeNotification的通知,通知会返回当前更改的NSUserDefaults实例对象回来。所以当需要监听某个NSUserDefaults数据存储的数据变化时,可以添加该通知的观察者
 10、我们的应用数据时存储在沙盒目录中的,正常情况下其他应用是无法读取到我们应用的数据.但是有两种情况是被允许应用去读取其他应用的数据：
    10.1、App extensions on macOS and iOS
    10.2、Other apps in your application group on macOS
    当我们有扩展程序或者多个应用在同一个应用组里面的时候就能被允许进行这样的操作.
    当我们设置了两个应用为在同一个App Groups后,我们的代码便可以通过组名来获取应用间共享的数据了
 11、Thread SafetyThe UserDefaults class is thread-safe. 系统在读写NSUserDefaults时是有做线程安全措施的,所以开发者在使用NSUserDefaults时是不需要考虑多线程问题

 */
#pragma mark —— Base
// TODO
#pragma mark —— Category
#import "NSUserDefaults+Manager.h"
#import "NSUserDefaults+Swizzle.h"

#endif /* JobsUserDefaults_h */
