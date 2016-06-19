//
//  NSDate+Component.m
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/17.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#import "NSDate+Component.h"

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

#define CALENDAR [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]
#define CALENDAR_UNIT (\
NSCalendarUnitYear|\
NSCalendarUnitMonth |\
NSCalendarUnitWeekOfYear |\
NSCalendarUnitWeekOfMonth |\
NSCalendarUnitWeekdayOrdinal |\
NSCalendarUnitWeekday |\
NSCalendarUnitDay |\
NSCalendarUnitHour |\
NSCalendarUnitMinute)

#define COMPONENTS(date) [CALENDAR components:CALENDAR_UNIT fromDate:date]

@implementation NSDate (Component)
#pragma mark - decomponent
- (NSInteger)year{
    NSDateComponents *components = COMPONENTS(self);
    return components.year;
}

- (NSInteger)month{
    NSDateComponents *components = COMPONENTS(self);
    return components.month;
}

- (NSInteger)weekday{
    NSDateComponents *components = COMPONENTS(self);
    return components.weekday;
}

- (NSInteger)day{
    NSDateComponents *components = COMPONENTS(self);
    return components.day;
}

- (NSInteger)hour{
    NSDateComponents *components = COMPONENTS(self);
    return components.hour;
}

- (NSInteger)minute{
    NSDateComponents *components = COMPONENTS(self);
    return components.minute;
}

- (NSInteger)seconds{
    NSDateComponents *components = COMPONENTS(self);
    return components.second;
}

#pragma mark - reset component
- (NSDate *)dateWithResetYear:(NSInteger)year {
    if ((year < 1970) || (year > 10000)) {
        return self;
    }

    NSDateComponents *comps = COMPONENTS(self);
    [comps setYear:year];

    return [CALENDAR dateFromComponents:comps];
}

- (NSDate *)dateWithResetMonth:(NSInteger)month {
    if ((month < 1) || (month > 12)) {
        return self;
    }

    NSDateComponents *comps = COMPONENTS(self);
    [comps setMonth:month];

    return [CALENDAR dateFromComponents:comps];
}

- (NSDate *)dateWithResetWeekday:(NSInteger)weekday {
    if ((weekday < 1) || (weekday > 7)) {
        return self;
    }

    NSDateComponents *comps = COMPONENTS(self);
    [comps setWeekday:weekday];

    return [CALENDAR dateFromComponents:comps];
}

- (NSDate *)dateWithResetDay:(NSInteger)day {
    if ((day < 1) || (day > 31)) {
        return self;
    }

    NSDateComponents *comps = COMPONENTS(self);
    [comps setDay:day];

    return [CALENDAR dateFromComponents:comps];
}

- (NSDate *)dateWithResetHour:(NSInteger)hour {
    if ((hour < 0) || (hour > 23)) {
        return self;
    }

    NSDateComponents *comps = COMPONENTS(self);
    [comps setHour:hour];

    return [CALENDAR dateFromComponents:comps];
}

- (NSDate *)dateWithResetMinute:(NSInteger)minute {
    if ((minute < 0) || (minute > 59)) {
        return self;
    }

    NSDateComponents *comps = COMPONENTS(self);
    [comps setMinute:minute];

    return [CALENDAR dateFromComponents:comps];
}

- (NSDate *)dateWithResetSeconds:(NSInteger)seconds {
    if ((seconds < 0) || (seconds > 59)) {
        return self;
    }

    NSDateComponents *comps = COMPONENTS(self);
    [comps setSecond:seconds];

    return [CALENDAR dateFromComponents:comps];
}

#pragma mark - date with componet offset
- (NSDate *)dateWithOffsetYears:(NSInteger)offset{
    if ((self.year+offset < 1970) || (self.year+offset > 10000)) {
        return self;
    }

    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:offset];
    return [CALENDAR dateByAddingComponents:adcomps toDate:self options:0];
}

- (NSDate *)dateWithOffsetMonths:(NSInteger)offset{
    if ((self.month+offset < 1) || (self.month+offset > 12)) {
        return self;
    }

    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setMonth:offset];
    return [CALENDAR dateByAddingComponents:adcomps toDate:self options:0];
}

- (NSDate *)dateWithOffsetDays:(NSInteger)offset{
    if ((self.day+offset < 1) || (self.day+offset > 31)) {
        return self;
    }

    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setDay:offset];
    return [CALENDAR dateByAddingComponents:adcomps toDate:self options:0];
}

- (NSDate *)dateWithOffsetHours:(NSInteger)offset{
    if ((self.hour+offset < 0) || (self.hour+offset > 23)) {
        return self;
    }

    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setHour:offset];
    return [CALENDAR dateByAddingComponents:adcomps toDate:self options:0];
}

- (NSDate *)dateWithOffsetMinutes:(NSInteger)offset{
    if ((self.minute+offset < 0) || (self.minute+offset > 59)) {
        return self;
    }

    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setMinute:offset];
    return [CALENDAR dateByAddingComponents:adcomps toDate:self options:0];
}

- (NSDate *)dateWithOffsetSeconds:(NSInteger)offset{
    if ((self.seconds+offset < 0) || (self.seconds+offset > 59)) {
        return self;
    }

    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setSecond:offset];
    return [CALENDAR dateByAddingComponents:adcomps toDate:self options:0];
}

#pragma mark - componet offset
- (NSInteger)offsetYearsToDate:(NSDate *)date {
    NSDateComponents *comps = [CALENDAR components:CALENDAR_UNIT fromDate:self toDate:date options:0];
    return comps.year;
}

- (NSInteger)offsetMonthsToDate:(NSDate *)date {
    NSDateComponents *comps = [CALENDAR components:CALENDAR_UNIT fromDate:self toDate:date options:0];
    return comps.month;
}

- (NSInteger)offsetWeeksToDate:(NSDate *)date {
    NSDateComponents *comps = [CALENDAR components:CALENDAR_UNIT fromDate:self toDate:date options:0];
    return comps.weekOfMonth;
}
- (NSInteger)offsetDaysToDate:(NSDate *)date {
    NSDateComponents *comps = [CALENDAR components:CALENDAR_UNIT fromDate:self toDate:date options:0];
    return comps.day;
}

- (NSInteger)offsetHoursToDate:(NSDate *)date {
    NSDateComponents *comps = [CALENDAR components:CALENDAR_UNIT fromDate:self toDate:date options:0];
    return comps.hour;
}

- (NSInteger)offsetMinutesToDate:(NSDate *)date {
    NSDateComponents *comps = [CALENDAR components:CALENDAR_UNIT fromDate:self toDate:date options:0];
    return comps.minute;
}

- (NSInteger)offsetSecondsToDate:(NSDate *)date {
    NSDateComponents *comps = [CALENDAR components:CALENDAR_UNIT fromDate:self toDate:date options:0];
    return comps.second;
}
@end
