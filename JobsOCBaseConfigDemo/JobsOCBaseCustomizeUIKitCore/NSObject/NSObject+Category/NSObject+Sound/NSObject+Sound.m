//
//  NSObject+Sound.m
//  Feidegou
//
//  Created by Kite on 2019/12/2.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//
#import "NSObject+Sound.h"

@implementation NSObject (Sound)
/// 播放自定义本地声音
/// fileName 文件名 包含后缀
-(jobsByStringBlock)playSoundWithFileName{
    return ^(NSString *_Nullable fileName){
        SystemSoundID soundID;
        /// 得到音效文件的地址
        NSURL *url = [NSBundle.mainBundle URLForResource:fileName withExtension:nil];
        /// 生成系统音效id
        OSStatus errorCode = AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url) , &soundID);
        if (errorCode) {
            NSLog(@"create sound failed");
            return;
        }
        /// 播放系统音效
        AudioServicesPlaySystemSound(soundID);
    };
}
/// 播放自定义本地声音
/// fileName 全文件名 包含后缀
-(jobsByStringBlock)playSoundEffect{
    return ^(NSString *_Nullable fileFullName){
        FileNameModel *fileNameModel = fileFullName.byFileFullName(fileFullName);
        SystemSoundID soundID;
        /// 得到音效文件的地址
        NSString *soundFilePath = [NSBundle.mainBundle pathForResource:fileNameModel.name ofType:fileNameModel.type];
        /// 生成系统音效id
        OSStatus errorCode = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundFilePath.jobsUrl, &soundID);
        if (errorCode) {
            NSLog(@"create sound failed");
            return;
        }
        /// 播放系统音效
        AudioServicesPlaySystemSound(soundID);
    };
}

@end
