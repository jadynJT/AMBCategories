//
//  NSDate+AMBAdd.h
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (AMBAdd)

/**
 年
 */
@property (nonatomic, readonly) NSInteger amb_year;

/**
 月(1-12)
 */
@property (nonatomic, readonly) NSInteger amb_month;

/**
 日(1-31)
 */
@property (nonatomic, readonly) NSInteger amb_day;

/**
 时(0-23)
 */
@property (nonatomic, readonly) NSInteger amb_hour;

/**
 分(0-59)
 */
@property (nonatomic, readonly) NSInteger amb_minute;

/**
 秒(0-59)
 */
@property (nonatomic, readonly) NSInteger amb_second;

/**
 纳秒
 */
@property (nonatomic, readonly) NSInteger amb_nanosecond;

/**
 星期几(1-7，第一天起始根据用户设置的，比如星期日为一周的第一天，则weekday为1)
 */
@property (nonatomic, readonly) NSInteger amb_weekday;

/**
 表示WeekDay在下一个更大的日历单元中的位置。例如WeekDay=3，WeekDayOrdinal=2就表示这个月的第2个周二。
 */
@property (nonatomic, readonly) NSInteger amb_weekdayOrdinal;

/**
 表示这个月的第几周(1-5)
 */
@property (nonatomic, readonly) NSInteger amb_weekOfMonth;

/**
 表示今年的第几周(1-53)
 */
@property (nonatomic, readonly) NSInteger amb_weekOfYear;

/**
 表示当前周所在的那一年，最主要是用于一年中的最后一周，以周四为分割点
 */
@property (nonatomic, readonly) NSInteger amb_yearForWeekOfYear;

/**
 季度
 */
@property (nonatomic, readonly) NSInteger amb_quarter;

/**
 是否是闰年
 */
@property (nonatomic, readonly) BOOL amb_isLeapYear;

/**
 是否是闰月
 */
@property (nonatomic, readonly) BOOL amb_isLeapMonth;

/**
 是否为今天
 */
@property (nonatomic, readonly) BOOL amb_isToday;

/**
 是否为昨天
 */
@property (nonatomic, readonly) BOOL amb_isYesterday;

/**
 根据当前的date生成新的date

 @param year 增加的年数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingYear:(NSInteger)year;

/**
 根据当前的date生成新的date

 @param month 增加的月数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingMonth:(NSInteger)month;

/**
 根据当前的date生成新的date

 @param week 增加的周数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingWeek:(NSInteger)week;

/**
 根据当前的date生成新的date

 @param day 增加的天数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingDay:(NSInteger)day;

/**
 根据当前的date生成新的date

 @param hour 增加的小时数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingHour:(NSInteger)hour;

/**
 根据当前的date生成新的date
 
 @param minute 增加的分钟数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingMinute:(NSInteger)minute;

/**
 根据当前的date生成新的date
 
 @param second 增加的秒数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingSecond:(NSInteger)second;

/**
 将日期转为字符串

 @param format 转换的格式(如:yyyy-MM-dd HH:mm:ss)
 @return 日期字符串
 */
- (NSString *)amb_stringWithFormat:(NSString *)format;

/**
 将日期转为字符串

 @param format 转换的格式(如:yyyy-MM-dd HH:mm:ss)
 @param timeZone 时区
 @param locale 本地化
 @return 日期字符串
 */
- (NSString *)amb_stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 将日期字符串转化为日期

 @param dateString 日期字符串
 @param format 转换的格式(如:yyyy-MM-dd HH:mm:ss)
 @return 日期，转化失败的话返回nil
 */
+ (NSDate *)amb_dateWithString:(NSString *)dateString format:(NSString *)format;

/**
 将日期字符串转化为日期

 @param dateString 日期字符串
 @param format 转换的格式(如:yyyy-MM-dd HH:mm:ss)
 @param timeZone 时区
 @param locale 本地化
 @return 日期，转化失败的话返回nil
 */
+ (NSDate *)amb_dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 获取某年某月有多少天
 
 @param year 年
 @param month 月
 @return 某年某月的天数，异常等返回NSNotFound
 */
+ (NSInteger)amb_getSumOfDaysInYear:(NSString *)year month:(NSString *)month;

@end
