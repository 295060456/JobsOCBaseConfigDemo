//
//  FormatTime.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/8.
//

#import <Foundation/Foundation.h>
#import "NSString+Others.h"
#import "MacroDef_String.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsFormatTime : NSObject
/// 时间之间的分隔形式。可以是：、可以是中文、也可以多语言化
@property(nonatomic,copy)NSString *year;
@property(nonatomic,copy)NSString *month;
@property(nonatomic,copy)NSString *day;
@property(nonatomic,copy)NSString *hour;
@property(nonatomic,copy)NSString *minute;
@property(nonatomic,copy)NSString *second;

-(NSString *_Nonnull)formatTimeWithYear:(NSString * _Nullable)year
                                  month:(NSString * _Nullable)month
                                    day:(NSString * _Nullable)day
                                   hour:(NSString * _Nullable)hour
                                 minute:(NSString * _Nullable)minute
                                 second:(NSString * _Nullable)second;

@end

NS_ASSUME_NONNULL_END
