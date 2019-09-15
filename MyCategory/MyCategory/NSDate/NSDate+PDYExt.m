//
//  NSDate+PDYExt.m
//  MyCategory
//
//  Created by MG_PDY on 2019/5/14.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSDate+PDYExt.h"

#import <objc/runtime.h>

typedef NS_OPTIONS(NSUInteger, WLCalendarUnit) {
    WLCalendarUnit_Year     = NSCalendarUnitYear,
    WLCalendarUnit_Month    = NSCalendarUnitMonth,
    WLCalendarUnit_Day      = NSCalendarUnitDay,
    WLCalendarUnit_Hour     = NSCalendarUnitHour,
    WLCalendarUnit_Minute   = NSCalendarUnitMinute,
    WLCalendarUnit_Second   = NSCalendarUnitSecond,
    
    WLCalendarUnit_yyMMdd   = (WLCalendarUnit_Year | WLCalendarUnit_Month | WLCalendarUnit_Day),
    WLCalendarUnit_HHmmss   = (WLCalendarUnit_Hour | WLCalendarUnit_Minute | WLCalendarUnit_Second),
    WLCalendarUnit_mmss     = (WLCalendarUnit_Minute | WLCalendarUnit_Second),
    
    WLCalendarUnit_All      = (WLCalendarUnit_yyMMdd | WLCalendarUnit_HHmmss)
};

@implementation NSDate (PDYExt)

- (NSDateComponents *)wl_comps {
    NSDateComponents *comps = objc_getAssociatedObject(self, _cmd);
    if (comps == nil) {
        comps = [[NSCalendar currentCalendar] components:(NSCalendarUnit)WLCalendarUnit_All fromDate:self];
        objc_setAssociatedObject(self, _cmd, comps, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return comps;
}
- (NSInteger)wl_year {
    return self.wl_comps.year;
}
- (NSInteger)wl_month {
    return self.wl_comps.month;
}
- (NSInteger)wl_day {
    return self.wl_comps.day;
}
- (NSInteger)wl_hour {
    return self.wl_comps.hour;
}
- (NSInteger)wl_minute {
    return self.wl_comps.minute;
}
- (NSInteger)wl_second {
    return self.wl_comps.second;
}

- (NSDateFormatter *)wl_formatterWith:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return formatter;
}
//- ()

@end
