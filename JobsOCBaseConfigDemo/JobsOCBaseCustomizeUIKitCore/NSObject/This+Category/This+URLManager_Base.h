//
//  This+URLManager_Base.h
//  FM
//
//  Created by Admin on 21/10/2024.
//

#import "This.h"
#import "NSObject+Extras.h"
#import "URLManagerModel.h"
#import "JobsBlock.h"
#import "NetworkingConstant.h"

NS_ASSUME_NONNULL_BEGIN
/// 域名列表
/// https://conf.betzz.cc/pages/viewpage.action?pageId=918653
@interface This (URLManager_Base)
#pragma mark —— BaseURL
+(NSString *)BaseUrl;
+(NSString *)BaseUrl_H5;
+(NSString *)BaseUrl_Image;
#pragma mark —— App接口示例
+(URLManagerModel *)appInterfaceTesting;

@end

NS_ASSUME_NONNULL_END
