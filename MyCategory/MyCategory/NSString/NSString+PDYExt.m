//
//  NSString+PDYExt.m
//  MyCategory
//
//  Created by MG_PDY on 2019/4/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSString+PDYExt.h"

@implementation NSString (PDYExt)

- (NSString *)dy_safePhone {
    NSString *phone = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (phone.length == 11) {
        phone = [NSString stringWithFormat:@"%@****%@", [phone substringWithRange:NSMakeRange(0, 3)], [phone substringWithRange:NSMakeRange(7, 4)]];
        
        return phone;
    }
    return @"";
}

@end
