//
//  NSDate+Component.h
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Component)
#pragma mark - decomponent
- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)weekday;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)seconds;

#pragma mark - reset component
- (NSDate *)dateWithResetYear:(NSInteger)year;
- (NSDate *)dateWithResetMonth:(NSInteger)month;
- (NSDate *)dateWithResetWeekday:(NSInteger)weekday;
- (NSDate *)dateWithResetDay:(NSInteger)day;
- (NSDate *)dateWithResetHour:(NSInteger)hour;
- (NSDate *)dateWithResetMinute:(NSInteger)minute;
- (NSDate *)dateWithResetSeconds:(NSInteger)seconds;

#pragma mark - componet offset
- (NSInteger)offsetYearsToDate:(NSDate *)date;
- (NSInteger)offsetMonthsToDate:(NSDate *)date;
- (NSInteger)offsetWeeksToDate:(NSDate *)date;
- (NSInteger)offsetDaysToDate:(NSDate *)date;
- (NSInteger)offsetHoursToDate:(NSDate *)date;
- (NSInteger)offsetMinutesToDate:(NSDate *)date;
- (NSInteger)offsetSecondsToDate:(NSDate *)date;

#pragma mark - date with componet offset
- (NSDate *)dateWithOffsetYears:(NSInteger)offset;
- (NSDate *)dateWithOffsetMonths:(NSInteger)offset;
- (NSDate *)dateWithOffsetDays:(NSInteger)offset;
- (NSDate *)dateWithOffsetHours:(NSInteger)offset;
- (NSDate *)dateWithOffsetMinutes:(NSInteger)offset;
- (NSDate *)dateWithOffsetSeconds:(NSInteger)offset;

@end
