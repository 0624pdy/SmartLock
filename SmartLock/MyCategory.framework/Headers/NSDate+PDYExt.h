//
//  NSDate+PDYExt.h
//  MyCategory
//
//  Created by MG_PDY on 2019/5/14.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PDYExt)

@property (nonatomic,strong,readonly) NSDateComponents *wl_comps;
@property (nonatomic,assign,readonly) NSInteger wl_year;
@property (nonatomic,assign,readonly) NSInteger wl_month;
@property (nonatomic,assign,readonly) NSInteger wl_day;
@property (nonatomic,assign,readonly) NSInteger wl_hour;
@property (nonatomic,assign,readonly) NSInteger wl_minute;
@property (nonatomic,assign,readonly) NSInteger wl_second;

@end
