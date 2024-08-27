//
//  JobsSnowflake.m
//  FM
//
//  Created by User on 8/27/24.
//  通过ChatGPT 翻译自 https://github.com/DamonHu/SnowflakeSwift

#import "JobsSnowflake.h"

static const uint32_t kSymbolBits = 1;
static const uint32_t kTimeBits = 41;
static const uint32_t kIDCBits = 5;
static const uint32_t kMachineBits = 5;
static const uint32_t kSequenceBits = 12;

@interface JobsSnowflake ()

@property(nonatomic,assign)uint32_t machine;
@property(nonatomic,assign)uint32_t IDC;
@property(nonatomic,assign)uint32_t sequence;
@property(nonatomic,assign)uint64_t publishMillisecond;
@property(nonatomic,assign)uint64_t lastGeneralMillisecond;

@end

@implementation JobsSnowflake
/// 初始化方法
/// - Parameters:
///   - publishMillisecond: 表示雪花算法开始生成 ID 的时间戳（以毫秒为单位）。这是生成 ID 时使用的基准时间。此参数设置生成雪花 ID 的起始时间点。例如，如果你希望雪花 ID 从某个特定的日期和时间开始生成，你需要提供该时刻的时间戳。
///   - IDC: 表示 IDC（数据中心）的标识符。用于唯一标识运行雪花算法的特定数据中心或集群。此参数帮助标识哪个数据中心或集群生成了某个雪花 ID。它允许你在多个数据中心中扩展 ID 生成而不会发生冲突。IDC 的值必须在算法配置允许的范围内（由 kIDCBits 定义）。
///   - machine: 表示数据中心内的机器或服务器的标识符。用于唯一标识生成雪花 ID 的特定机器或服务器。此参数帮助区分同一数据中心内不同机器生成的 ID。即使多台机器在生成 ID，每台机器生成的 ID 也将保持唯一。机器 ID 的值必须在算法配置允许的范围内（由 kMachineBits 定义）。
-(instancetype _Nonnull)initWithPublishMillisecond:(uint64_t)publishMillisecond
                                             IDCID:(uint32_t)IDC
                                         machineID:(uint32_t)machine{
    if (self = [super init]) {
        NSAssert(publishMillisecond <= ((uint64_t)1 << kTimeBits), @"time is too big");
        NSAssert(IDC <= ((uint32_t)1 << kIDCBits), @"IDC id is too big");
        NSAssert(machine <= ((uint32_t)1 << kMachineBits), @"machine id is too big");
        
        self.publishMillisecond = publishMillisecond;
        self.lastGeneralMillisecond = publishMillisecond;
        self.IDC = IDC & ((1 << kIDCBits) - 1);
        self.machine = machine & ((1 << kMachineBits) - 1);
        self.sequence = 0;
    }return self;
}

-(nullable NSNumber *)nextID{
    uint64_t currentTime = (uint64_t)NSDate.date.timeIntervalSince1970 * 1000;
    if (self.lastGeneralMillisecond < currentTime) {
        self.lastGeneralMillisecond = currentTime;
        self.sequence = 0;
    } else if (self.lastGeneralMillisecond == currentTime) {
        self.sequence = (self.sequence + 1) & ((1 << kSequenceBits) - 1);
        if (self.sequence == 0) {
            usleep(1000);
            currentTime = (uint64_t)NSDate.date.timeIntervalSince1970 * 1000;
            self.lastGeneralMillisecond = currentTime;
        }
    } else {
        // Clock rollback, should handle according to business logic
        return nil;
    }
    
    uint64_t timeParameter = self.lastGeneralMillisecond - self.publishMillisecond;
    uint64_t timeOffset = kIDCBits + kMachineBits + kSequenceBits;
    
    uint64_t idcParameter = self.IDC;
    uint64_t idcOffset = kMachineBits + kSequenceBits;
    
    uint64_t machineParameter = self.machine;
    uint64_t machineOffset = kSequenceBits;
    
    uint64_t result = (timeParameter << timeOffset) | (idcParameter << idcOffset) | (machineParameter << machineOffset) | self.sequence;
    return @(result);  // Return as NSNumber
}

- (uint64_t)timeWithID:(uint64_t)id {
    uint64_t timeOffset = kIDCBits + kMachineBits + kSequenceBits;
    return (id >> timeOffset) + self.publishMillisecond;
}

- (uint32_t)IDCWithID:(uint64_t)id {
    uint64_t step1 = id << (kTimeBits + kSymbolBits);
    return (uint32_t)(step1 >> (kTimeBits + kMachineBits + kSequenceBits + kSymbolBits));
}

- (uint32_t)machineWithID:(uint64_t)id {
    uint64_t step1 = id << (kTimeBits + kIDCBits + kSymbolBits);
    return (uint32_t)(step1 >> (kIDCBits + kTimeBits + kSequenceBits + kSymbolBits));
}

@end
