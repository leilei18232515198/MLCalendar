//
//  NSDate+MLCalender.m
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 杨磊. All rights reserved.
//

#import "NSDate+MLCalender.h"

@implementation NSDate (MLCalender)


#pragma mark -- 获取日
- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.day;
}

#pragma mark -- 获取月
- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.month;
}

#pragma mark -- 获取年
- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.year;
}

#pragma mark -- 获得当前月份第一天星期几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //设置每周的第一天从周几开始,默认为1,从周日开始
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    //若设置从周日开始算起则需要减一,若从周一开始算起则不需要减
    return firstWeekday - 1;
}
#pragma mark -- 获取当前月共有多少天

- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}


- (NSInteger) getweekDayStringWithDate:(NSDate *)date{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    NSNumber * weekNumber = @([comps weekday]);
    NSInteger weekInt = [weekNumber integerValue];
//    NSString *week;
//    switch (weekInt) {
//        case 1:
//            week = @"日";
//            break;
//        case 2:
//            week = @"一";
//            break;
//        case 3:
//            week = @"二";
//            break;
//        case 4:
//            week = @"三";
//            break;
//        case 5:
//            week = @"四";
//            break;
//        case 6:
//            week = @"五";
//            break;
//        case 7:
//            week = @"六";
//            break;
//
//        default:
//            break;
//    }
    return weekInt;
}

-(NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month{
     NSDateComponents *comps = [[NSDateComponents alloc] init];
     [comps setMonth:month];
     NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//NSGregorianCalendar
     NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
     return mDate;
}


-(NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withDate:(int)day{
     NSDateComponents *comps = [[NSDateComponents alloc] init];
     [comps setDay:day];
     NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//NSGregorianCalendar
     NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
     return mDate;
}

@end
