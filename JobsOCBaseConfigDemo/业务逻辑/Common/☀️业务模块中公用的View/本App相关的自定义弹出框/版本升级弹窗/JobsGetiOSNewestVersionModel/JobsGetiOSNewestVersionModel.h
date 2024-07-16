//
//  JobsGetiOSNewestVersionModel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsGetiOSNewestVersionModel : NSObject

@property(nonatomic,copy)NSString *createBy;
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *downloadUrl;// 下载地址
@property(nonatomic,strong)NSNumber *ID;
@property(nonatomic,assign)JobsUpdateType isForced;// 强制更新：1、是 ; 2、否
@property(nonatomic,copy)NSString *name;// 版本名称
@property(nonatomic,copy)NSString *remark;// 备注
@property(nonatomic,assign)JobsTerminalType terminalType;// 终端类型 : 1、Android ; 2、iOS
@property(nonatomic,strong)NSNumber *updateBy;
@property(nonatomic,copy)NSString *updateTime;
@property(nonatomic,copy)NSString *versionNumber;// 版本号

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
