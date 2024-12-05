//
//  NSObject+Algorithm.m
//  FM
//
//  Created by Admin on 29/11/2024.
//

#import "NSObject+Algorithm.h"

@implementation NSObject (Algorithm)
/// 将数据做成3列，第一个元素的下标是1，判断任意一个下标数，处于哪一列
-(JobsReturnIntByIntBlock _Nonnull)column3By{
    return ^int(int n){
        return ((n - 1) % 3) + 1;
    };
}
/// 给定一个数据源（数组）和 每行需要展示的元素个数，计算行数
-(NSInteger)count:(NSUInteger)count num:(NSInteger)num{
    return (count + (num - 1)) / num;
}
/// 判断任意给定的一个整型是多少位数
-(JobsReturnByNSIntegerBlock _Nonnull)bitNum{
    return ^NSInteger(NSInteger number){
        NSInteger count = 0;
        while(number != 0){
            number /= 10;
            count++;
        }printf("数字是 %ld 位数。", (long)count);
        return count;
    };
}
/// 判断任意数字是否为小数
-(JobsReturnBOOLByCGFloatBlock _Nonnull)isFloat{
    return ^BOOL(CGFloat num){
        return num - (int)num;
    };
}
/**
    判断 num1 是否能被 num2 整除
    也就是判断 num2 是否是 num1 的整数倍
    也就是判断 num1 除以 num2 的余数是否是 0
 
    特别指出的是：
    1、除数为零的情况，被判定为不能被整除；
    2、num1 和 num2 必须为 NSNumber* 类型，否则判定为不能够被整除
 */
-(BOOL)judgementExactDivisionByNum1:(NSNumber *_Nonnull)num1
                               num2:(NSNumber *_Nonnull)num2{
    /// 过滤数据类型
    if (![num1 isKindOfClass:NSNumber.class] || ![num2 isKindOfClass:NSNumber.class]) return NO;
    /// 在数据类型为NSNumber* 的基础上进行讨论和判断
    if (num1 == num2) return YES;
    if (num2.floatValue) {
        int a = num2.intValue;
        double s1 = num1.doubleValue;
        int s2 = num1.intValue;
        return s1/a-s2/a <= 0;
    }else return YES;
}
/// 雪花算法
-(NSNumber *_Nonnull)makeSnowflake{
    JobsSnowflake *snowflake = [JobsSnowflake.alloc initWithPublishMillisecond:self.currentUnixTimeStampInMilliseconds
                                                                         IDCID:1
                                                                     machineID:1];
    NSNumber *snowflakeID = snowflake.nextID;
    if (snowflakeID){
        NSLog(@"Generated Snowflake ID: %@", snowflakeID);
    }else{
        NSLog(@"Failed to generate Snowflake ID.");
    }return snowflakeID;
}
/// 查询算法
/// @param data 查询的数据源
/// @param searchStrategy 查询策略
/// @param keywords 关键词
-(NSMutableSet *_Nullable)dimSearchWithData:(id _Nonnull)data
                             searchStrategy:(JobsSearchStrategy)searchStrategy
                                   keywords:(NSString *_Nonnull)keywords{
    NSMutableSet *__block resMutSet = NSMutableSet.set;
    JobsReturnIDByIDBlock dimSearchBlock = ^(id data){
        for (id obj in data) {// 系统Api提供的基础对象元素
            if ([obj isKindOfClass:NSNumber.class] ||
                [obj isKindOfClass:NSString.class]) {
                if ([obj stringValue].containsString(keywords)) {
                    resMutSet.add(obj);
                }
            }else{// 自定义的对象
                NSObject *customObj = (NSObject *)obj;
                NSMutableArray <NSString *>*propertyList = customObj.propertyList;
                for (NSString *str in propertyList) {
                    switch (searchStrategy) {
                        case JobsSearchStrategy_Accurate:{
                            /// 精确查询
                            if ([customObj.valueForKey(str) stringValue].lowercaseString.containsString(keywords.lowercaseString)) {
                                resMutSet.add(customObj);
                            }
                        }break;
                        case JobsSearchStrategy_Fuzzy:{
                            /// 模糊查询
                            if ([customObj.valueForKey(str) stringValue].containsString(keywords)) {
                                resMutSet.add(customObj);
                            }
                        }break;
                        default:
                            break;
                    }
                }
            }
        }return resMutSet;
    };
    
    if ([data isKindOfClass:NSDictionary.class]){
        NSDictionary *dataDic = (NSDictionary *)data;
        [dataDic enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key,
                                                     id _Nonnull obj,
                                                     BOOL *_Nonnull stop) {
            /// Key-Value，value包含关键词则存储对外输出
            if ([[obj stringValue] containsString:keywords]) {
                /// 用Set保证对外输出的唯一性
                resMutSet.add(obj);
            }
        }];
    }else if([data isKindOfClass:NSArray.class] ||
             [data isKindOfClass:NSSet.class]){
        if(dimSearchBlock) resMutSet = dimSearchBlock(data);
    }else{}return resMutSet;
}
/// 以当前手机系统时间（包含了时区）为基准，给定一个日期偏移值（正值代表未来，负值代表过去，0代表现在），返回字符串特定格式的“星期几”
-(JobsReturnStringByIntegerBlock _Nonnull)whatDayOfWeekDistanceNow{
    return ^NSString *_Nullable(NSInteger offsetDay){
        JobsTimeModel *timeModel = JobsTimeModel.makeSpecificTime;
        NSInteger currentWeekday = timeModel.currentWeekday;//当前时间是周几？1代表周日 2代表周一 7代表周六
        NSInteger offsetResDay = currentWeekday + offsetDay;//偏移量以后的值，对这个值进行分析和讨论
        NSInteger resResWeekDay = 0;//处理的结果落在0~6
        
        if (offsetDay > 0) {/// 未来
            resResWeekDay = offsetResDay % 7;
        }else if (offsetDay < 0){/// 昨天
            if (offsetResDay > 0) {
                resResWeekDay = offsetResDay % 7;
            }else if (offsetResDay < 0){
                resResWeekDay = (7 + offsetResDay % 7) % 7;//核心算法
            }else{/// offsetResDay == 0
                resResWeekDay = currentWeekday;
            }
        }else{/// offsetDay == 0 现在
            resResWeekDay = currentWeekday;
        }

        switch (resResWeekDay) {
            case 0:{
                return JobsInternationalization(@"星期六");
            }break;
            case 1:{
                return JobsInternationalization(@"星期日");
            }break;
            case 2:{
                return JobsInternationalization(@"星期一");
            }break;
            case 3:{
                return JobsInternationalization(@"星期二");
            }break;
            case 4:{
                return JobsInternationalization(@"星期三");
            }break;
            case 5:{
                return JobsInternationalization(@"星期四");
            }break;
            case 6:{
                return JobsInternationalization(@"星期五");
            }break;
                
            default:
                return JobsInternationalization(@"异常数据");
                break;
        }
    };
}

@end
