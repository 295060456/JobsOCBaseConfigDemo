# 时间格式化

[toc]

## 一、NSDateFormatter

* 日期格式字符串是由不同的格式符号组成的，每个符号代表日期或时间的一部分

* ```objective-c
    NSString *currentTimestampString() {
        return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
            dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        }).stringByDate(NSDate.date);
    }
  ```

## 二、`@"yyyy-MM-dd HH:mm:ss"`的含义
  * `yyyy`：四位数的年份（例如：2024）
  * `MM`：两位数的月份（例如：07，表示七月）
  * `dd`：两位数的日期（例如：18，表示18号）
  * `HH`：两位数的小时，24小时制（例如：14，表示下午2点）
  * `mm`：两位数的分钟（例如：30，表示30分钟）
  * `ss`：两位数的秒（例如：45，表示45秒）

## 三、更多格式符号及其含义

  * 年（Year）

    * `y`：一位数或两位数的年份（例如：9，99）
    * `yy`：两位数的年份（例如：99，07）
    * `yyyy`：四位数的年份（例如：1999，2024）
  * 月（Month）

    * `M`：一位数或两位数的月份（例如：7，12）
    * `MM`：两位数的月份（例如：07，12）
    * `MMM`：缩写的月份名称（例如：Jul，Dec）
    * `MMMM`：全称的月份名称（例如：July，December）
  * 日（Day）

    * `d`：一位数或两位数的日期（例如：3，25）
    * `dd`：两位数的日期（例如：03，25）
    * `E`：缩写的星期几名称（例如：Tue，Wed）
    * `EEEE`：全称的星期几名称（例如：Tuesday，Wednesday）
  * 时（Hour）

    * `h`：一位数或两位数的小时，12小时制（例如：3，11）
    * `hh`：两位数的小时，12小时制（例如：03，11）
    * `H`：一位数或两位数的小时，24小时制（例如：3，15）
    * `HH`：两位数的小时，24小时制（例如：03，15）
  * 分（Minute）

    * `m`：一位数或两位数的分钟（例如：4，28）
    * `mm`：两位数的分钟（例如：04，28）
  * 秒（Second）

    * `s`：一位数或两位数的秒（例如：5，45）
    * `ss`：两位数的秒（例如：05，45）
  * 毫秒（Milliseconds）

    * `S`：一到三位数的毫秒（例如：7，68，345）
    * `SSS`：三位数的毫秒（例如：007，068，345）
  * 时区（Time Zone）
    * `z`：时区缩写（例如：PST，EST）
    * `zzzz`：时区全称（例如：Pacific Standard Time，Eastern Standard Time）
    * `Z`：时区偏移量（例如：-0800，+0530）
