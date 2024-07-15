//
//  AppDelegate.m
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import "AppDelegate.h"

#import "AppDelegate+TabBarCtr.h"
#import "AppDelegate+Func.h"
#import "AppDelegate+UIApplicationDelegate.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface AppDelegate ()

@end

@implementation AppDelegate

static AppDelegate *AppDelegateInstance = nil;
static dispatch_once_t AppDelegateOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&AppDelegateOnceToken, ^{
        AppDelegateInstance = [super allocWithZone:NULL].init;
    });return AppDelegateInstance;
}
/// 单例的销毁
+(void)destroyInstance{
    AppDelegateOnceToken = 0;
    AppDelegateInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    dispatch_once(&AppDelegateOnceToken, ^{
        AppDelegateInstance = [super allocWithZone:zone];
    });return AppDelegateInstance;
}

-(instancetype)copyWithZone:(NSZone *)zone{
    return self;
}

-(instancetype)mutableCopyWithZone:(NSZone *)zone{
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        [self simulateUserData];
    }return self;
}
#pragma mark —— 一些私有方法
/// 模拟用户数据
-(void)simulateUserData{
    JobsUserModel *userModel = JobsUserModel.new;
    userModel.userHeaderIMG = JobsIMG(@"用户默认头像");
    userModel.userName = @"张三丰";
    userModel.phone = @"134****0000";
    [self saveUserInfo:userModel];
    
    id f = self.readUserInfo;
    NSLog(@"");
}
#pragma mark —— 一些公有方法
/// Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if (context.hasChanges && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
#pragma mark —— lazyLoad
/// Core Data stack
@synthesize persistentContainer = _persistentContainer;
- (NSPersistentCloudKitContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [NSPersistentCloudKitContainer.alloc initWithName:HDAppDisplayName];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription,
                                                                              NSError *error) {
                if (error) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }return _persistentContainer;
}

@end

#pragma clang diagnostic pop
