//
//  NSObject+LiveChat.m
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import "NSObject+LiveChat.h"

@implementation NSObject (LiveChat)
#pragma mark —— 一些公有方法
-(jobsByVoidBlock _Nonnull)configLiveChat{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        LiveChat.licenseId = LiveChatKEY; // Set your licence number here
        LiveChat.groupId = @"77"; // Optionally, you can set specific group
        LiveChat.name = @"iOS Widget Example"; // User name and email can be provided if known
        LiveChat.email = @"example@livechatinc.com";
        
        [LiveChat setVariableWithKey:@"First variable name" value:@"Some value"];
        [LiveChat setVariableWithKey:@"Second name" value:@"Other value"];
        
        LiveChat.delegate = self;
    };
}

-(jobsByVoidBlock _Nonnull)openChat{
    return ^(){
        [LiveChat presentChatWithAnimated:YES completion:nil];
    };
}

-(jobsByVoidBlock _Nonnull)clearSession{
    return ^(){
        [LiveChat clearSession];
    };
}
#pragma mark —— 一些私有方法
-(JobsReturnAlertControllerByStringBlock _Nonnull)makeAlertControllerBy{
    @jobs_weakify(self)
    return ^__kindof UIAlertController *_Nullable(NSString *_Nullable string){
        UIAlertController *alertVC = JobsMakeAlertControllerBy(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
            data.alertControllerTitle = JobsInternationalization(@"Support");
            data.message = string;
            data.preferredStyle = UIAlertControllerStyleAlert;
        }));
        alertVC.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *_Nullable data) {
            data.alertActionTitle = JobsInternationalization(@"Go to Chat");
            data.alertActionStyle = UIAlertActionStyleDefault;
            data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
                if (!LiveChat.isChatPresented) [LiveChat presentChatWithAnimated:YES completion:nil];
            };
        })));
        alertVC.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *_Nullable data) {
            data.cancelAlertActionTitle = JobsInternationalization(@"Cancel");
            data.alertActionStyle = UIAlertActionStyleCancel;
            data.alertActionBlock = ^(__kindof UIAlertAction *_Nullable action) {
                @jobs_strongify(self)
                self.clearSession();
            };
        })));return alertVC;
    };
}
#pragma mark —— LiveChatDelegate
- (void)receivedWithMessage:(LiveChatMessage *)message{
    if (!LiveChat.isChatPresented) {
        self.getCurrentViewController.comingToPresentVC(self.makeAlertControllerBy(message.text));
    }
}

-(void)chatPresented {
    NSLog(@"Chat presented");
}

-(void)chatDismissed {
    NSLog(@"Chat dismissed");
}

-(void)chatLoadingFailedWith:(NSError *)error {
    NSLog(@"Chat loading failure %@", error.localizedDescription);
}

-(void)handleWithURL:(NSURL *)URL{
    self.jobsOpenURL(URL);
}

@end
