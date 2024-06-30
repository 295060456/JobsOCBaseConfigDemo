//
//  FormatTime.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsFormatTime : NSObject
/// 时间之间的分隔形式。可以是：、可以是中文、也可以多语言化
@property(nonatomic,strong)NSString *year;
@property(nonatomic,strong)NSString *month;
@property(nonatomic,strong)NSString *day;
@property(nonatomic,strong)NSString *hour;
@property(nonatomic,strong)NSString *minute;
@property(nonatomic,strong)NSString *second;

-(NSString *_Nonnull)formatTimeWithYear:(NSString * _Nullable)year
                                  month:(NSString * _Nullable)month
                                    day:(NSString * _Nullable)day
                                   hour:(NSString * _Nullable)hour
                                 minute:(NSString * _Nullable)minute
                                 second:(NSString * _Nullable)second;

@end

NS_ASSUME_NONNULL_END
