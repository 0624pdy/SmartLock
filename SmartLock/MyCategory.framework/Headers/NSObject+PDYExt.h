//
//  NSObject+PDYExt.h
//  MyCategory
//
//  Created by MG_PDY on 2019/3/13.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PDYExt)

/**
 *  交换方法的实现
 *  @param s1 - 方法1
 *  @param s2 - 方法2
 */
+ (void)wl_exchangeSelector:(SEL)s1 toSelector:(SEL)s2;
/**
 *  交换方法的实现
 *  @param s1 - 方法1
 *  @param s2 - 方法2
 */
+ (void)wl_exchangeSEL:(SEL)s1 toSEL:(SEL)s2;

@property (nonatomic,copy,readonly) NSString *dy_name;

@end
