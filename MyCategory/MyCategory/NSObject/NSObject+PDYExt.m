//
//  NSObject+PDYExt.m
//  MyCategory
//
//  Created by MG_PDY on 2019/3/13.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSObject+PDYExt.h"

#import <objc/runtime.h>

@implementation NSObject (PDYExt)

+ (void)wl_exchangeSelector:(SEL)s1 toSelector:(SEL)s2 {
    
    Class class         = [self class];
    SEL fromSEL         = s1;
    SEL toSEL           = s2;
    Method fromMethod   = class_getInstanceMethod(class, fromSEL);
    Method toMethod     = class_getInstanceMethod(class, toSEL);
    IMP toIMP           = method_getImplementation(toMethod);
    const char *typeEncode = method_getTypeEncoding(toMethod);
    
    BOOL success = class_addMethod(class, toSEL, toIMP, typeEncode);
    if (!success) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}
+ (void)wl_exchangeSEL:(SEL)s1 toSEL:(SEL)s2 {
    [self wl_exchangeSelector:s1 toSelector:s2];
}

- (NSString *)dy_name {
    return NSStringFromClass([self class]);
}

@end
