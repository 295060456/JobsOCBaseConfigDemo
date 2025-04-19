//
//  JobsGetiOSNewestVersionModel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/10.
//

#import <Foundation/Foundation.h>
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举

NS_ASSUME_NONNULL_BEGIN

@interface JobsGetiOSNewestVersionModel : NSObject

Prop_copy()NSString *createBy;
Prop_copy()NSString *createTime;
Prop_copy()NSString *downloadUrl;// 下载地址
Prop_strong()NSNumber *ID;
Prop_assign()JobsUpdateType isForced;// 强制更新：1、是 ; 2、否
Prop_copy()NSString *name;// 版本名称
Prop_copy()NSString *remark;// 备注
Prop_assign()JobsOperationType terminalType;// 终端类型
Prop_strong()NSNumber *updateBy;
Prop_copy()NSString *updateTime;
Prop_copy()NSString *versionNumber;// 版本号

@end

NS_ASSUME_NONNULL_END

/**
 
 {
     createBy = 5;
     createTime = "2021-11-25 16:36:28";
     downloadUrl = "https://mbdp.qasdds.com/HoWBn.html";
     id = 2;
     isForced = 2;
     name = ios;
     remark = "<null>";
     terminalType = 2;//???
     updateBy = 6;
     updateTime = "2021-12-15 12:49:30";
     versionNumber = "1.0.1";
 }
 
 */
