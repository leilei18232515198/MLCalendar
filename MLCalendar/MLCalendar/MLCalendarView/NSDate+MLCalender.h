//
//  NSDate+MLCalender.h
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 杨磊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MLCalender)

#pragma mark -- 获取日
- (NSInteger)day:(NSDate *)date;
#pragma mark -- 获取月
- (NSInteger)month:(NSDate *)date;
#pragma mark -- 获取年
- (NSInteger)year:(NSDate *)date;
#pragma mark -- 获得当前月份第一天星期几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
#pragma mark -- 获取当前月共有多少天
- (NSInteger)totaldaysInMonth:(NSDate *)date;
- (NSInteger) getweekDayStringWithDate:(NSDate *)date;
-(NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month;
-(NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withDate:(int)day;
@end

NS_ASSUME_NONNULL_END
