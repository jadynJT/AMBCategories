//
//  NSDate+AMBAdd.m
//  AMBBaseFramework
//
//  Created by   马海林 on 2018/5/24.
//  Copyright © 2018年   马海林. All rights reserved.
//

#import "NSDate+AMBAdd.h"

@implementation NSDate (AMBAdd)

#pragma mark -
#pragma mark ==== 外部使用方法 ====
#pragma mark -

/**
 根据当前的date生成新的date
 
 @param year 增加的年数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingYear:(NSInteger)year
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = year;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}

/**
 根据当前的date生成新的date
 
 @param month 增加的月数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingMonth:(NSInteger)month
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = month;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}

/**
 根据当前的date生成新的date
 
 @param week 增加的周数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingWeek:(NSInteger)week
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekOfYear = week;
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
}

/**
 根据当前的date生成新的date
 
 @param day 增加的天数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingDay:(NSInteger)day
{
    NSTimeInterval timeInterval = self.timeIntervalSinceReferenceDate + 60 * 60 * 24 * day;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return newDate;
}

/**
 根据当前的date生成新的date
 
 @param hour 增加的小时数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingHour:(NSInteger)hour
{
    NSTimeInterval timeInterval = self.timeIntervalSinceReferenceDate + 60 * 60 * hour;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return newDate;
}

/**
 根据当前的date生成新的date
 
 @param minute 增加的分钟数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingMinute:(NSInteger)minute
{
    NSTimeInterval timeInterval = self.timeIntervalSinceReferenceDate + 60 * minute;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return newDate;
}

/**
 根据当前的date生成新的date
 
 @param second 增加的秒数，(正负值都可以)
 @return 新的date
 */
- (NSDate *)amb_dateByAddingSecond:(NSInteger)second
{
    NSTimeInterval timeInterval = self.timeIntervalSinceReferenceDate + second;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return newDate;
}

/**
 将日期转为字符串
 
 @param format 转换的格式(如:yyyy-MM-dd HH:mm:ss)
 @return 日期字符串
 */
- (NSString *)amb_stringWithFormat:(NSString *)format
{
    return [self amb_stringWithFormat:format timeZone:nil locale:[NSLocale currentLocale]];
}

/**
 将日期转为字符串
 
 @param format 转换的格式(如:yyyy-MM-dd HH:mm:ss)
 @param timeZone 时区
 @param locale 本地化
 @return 日期字符串
 */
- (NSString *)amb_stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    
    if (timeZone)
    {
        formatter.timeZone = timeZone;
    }
    
    if (locale)
    {
        formatter.locale = locale;
    }
    
    return [formatter stringFromDate:self];
}

/**
 将日期字符串转化为日期
 
 @param dateString 日期字符串
 @param format 转换的格式(如:yyyy-MM-dd HH:mm:ss)
 @return 日期，转化失败的话返回nil
 */
+ (NSDate *)amb_dateWithString:(NSString *)dateString format:(NSString *)format
{
    return [[self class] amb_dateWithString:dateString format:format timeZone:nil locale:nil];
}

/**
 将日期字符串转化为日期
 
 @param dateString 日期字符串
 @param format 转换的格式(如:yyyy-MM-dd HH:mm:ss)
 @param timeZone 时区
 @param locale 本地化
 @return 日期，转化失败的话返回nil
 */
+ (NSDate *)amb_dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    
    if (timeZone)
    {
        formatter.timeZone = timeZone;
    }
    
    if (locale)
    {
        formatter.locale = locale;
    }
    
    return [formatter dateFromString:dateString];
}

/**
 获取某年某月有多少天

 @param year 年
 @param month 月
 @return 某年某月的天数，异常等返回NSNotFound
 */
+ (NSInteger)amb_getSumOfDaysInYear:(NSString *)year month:(NSString *)month
{
    NSInteger days = NSNotFound;
    
    if (year.length > 0 && month.length > 0)
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM"];
        NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%@-%@",year, month]];
        
        if (date)
        {
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            days = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
        }
    }

    return days;
}

#pragma mark -
#pragma mark ==== 数据初始化 ====
#pragma mark -

- (NSInteger)amb_year
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)amb_month
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)amb_day
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)amb_hour
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)amb_minute
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)amb_second
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)amb_nanosecond
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitNanosecond fromDate:self] nanosecond];
}

- (NSInteger)amb_weekday
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)amb_weekdayOrdinal
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)amb_weekOfMonth
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)amb_weekOfYear
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)amb_yearForWeekOfYear
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)amb_quarter
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (BOOL)amb_isLeapYear
{
    NSUInteger year = self.amb_year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)amb_isLeapMonth
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)amb_isToday
{
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24)
    {
        return NO;
    }
    
    return [NSDate new].amb_day == self.amb_day;
}

- (BOOL)amb_isYesterday
{
    NSDate *newDate = [self amb_dateByAddingDay:1];
    return [newDate amb_isToday];
}

@end
